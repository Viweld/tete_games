// Patches unmigrated Flutter plugins for AGP built-in Kotlin (android.builtInKotlin=true).
// Temporary until plugin authors remove kotlin-android from their android/build.gradle.

import groovy.json.JsonSlurper
import java.io.File

val projectRootDir: File = settings.rootDir.parentFile
val patchMarker: String = "// tete-games-built-in-kotlin-patch"

fun extractJvmTarget(text: String): String {
    val match = Regex("(?ms)kotlinOptions\\s*\\{[^}]*jvmTarget\\s*=\\s*([^\\n]+)").find(text)
    val raw = match?.groupValues?.get(1)?.trim().orEmpty()
    return when {
        raw.contains("11") -> "JVM_11"
        raw.contains("1.8") || raw.contains("VERSION_1_8") -> "JVM_1_8"
        else -> "JVM_17"
    }
}

fun patchPluginAndroidModule(androidDir: File) {
    val buildGradle = File(androidDir, "build.gradle")
    val buildGradleKts = File(androidDir, "build.gradle.kts")
    val buildFile =
        when {
            buildGradleKts.isFile -> buildGradleKts
            buildGradle.isFile -> buildGradle
            else -> return
        }

    var text = buildFile.readText()
    if (patchMarker in text && !text.contains("kotlin-android")) {
        val needsJvm11 = text.contains("JavaVersion.VERSION_11")
        if (needsJvm11 && text.contains("JvmTarget.JVM_17")) {
            buildFile.writeText(text.replace("JvmTarget.JVM_17", "JvmTarget.JVM_11"))
        }
        return
    }
    if (!text.contains("kotlin-android")) {
        return
    }

    val jvmTarget = extractJvmTarget(text)

    text =
        text.replace(Regex("(?m)^\\s*apply plugin:\\s*[\"']kotlin-android[\"']\\s*\r?\n"), "")
    text = text.replace(Regex("(?m)^\\s*id\\([\"']kotlin-android[\"']\\)\\s*\r?\n"), "")
    text = text.replace(Regex("(?ms)\\n\\s*kotlinOptions\\s*\\{[^}]*\\}"), "")
    text = text.replace(Regex("(?ms)\n\n$patchMarker[\\s\\S]*"), "")

    val kotlinBlock =
        """

$patchMarker
kotlin {
    compilerOptions {
        jvmTarget = org.jetbrains.kotlin.gradle.dsl.JvmTarget.$jvmTarget
    }
}
""".trimIndent()

    buildFile.writeText(text.trimEnd() + "\n\n$kotlinBlock\n")
}

fun patchFlutterPluginsForBuiltInKotlin() {
    val depsFile = File(projectRootDir, ".flutter-plugins-dependencies")
    if (!depsFile.isFile) {
        return
    }

    val json = JsonSlurper().parse(depsFile)
    if (json !is Map<*, *>) {
        return
    }
    val plugins = json["plugins"]
    if (plugins !is Map<*, *>) {
        return
    }
    val androidPlugins = plugins["android"]
    if (androidPlugins !is List<*>) {
        return
    }

    for (plugin in androidPlugins) {
        if (plugin !is Map<*, *>) {
            continue
        }
        val path = plugin["path"]
        if (path !is String) {
            continue
        }
        patchPluginAndroidModule(File(path, "android"))
    }
}

patchFlutterPluginsForBuiltInKotlin()
