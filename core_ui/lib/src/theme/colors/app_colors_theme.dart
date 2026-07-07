part of '../theme.dart';

abstract class AppColorsTheme extends ThemeExtension<AppColorsTheme> {
  const AppColorsTheme();

  Color get unknown;

  Color get barrierColor;

  double get barrierBlurSigma;

  Color get progressIndicator;

  List<BoxShadow> get dialogShadows;

  List<BoxShadow> get cardShadows;

  List<BoxShadow> get cardBottomShadows;

  List<BoxShadow> get dropdownShadows;

  AppBackgroundTheme get background;

  AppRadioTheme get radio;

  AppIconsTheme get icons;

  AppTextTheme get text;

  AppBorderTheme get borders;

  AppAppBarTheme get appBar;

  AppNavBarTheme get navBar;

  AppElevatedButtonTheme get elevatedButton;

  AppOutlinedButtonTheme get outlinedButton;

  AppTextButtonTheme get textButton;

  AppTextFieldTheme get textField;

  AppSelectionTheme get selection;

  AppPinFieldTheme get pinfield;

  AppDatePickerTheme get datePicker;

  AppLinkTheme get link;

  AppToastTheme get toast;

  @override
  ThemeExtension<AppColorsTheme> copyWith() => this;

  @override
  ThemeExtension<AppColorsTheme> lerp(covariant ThemeExtension<AppColorsTheme>? other, double t) =>
      this;
}

class LightColorTheme extends AppColorsTheme {
  @override
  Color get unknown => AppColors.unknown;

  @override
  Color get barrierColor => AppColors.actPlug;

  @override
  double get barrierBlurSigma => 3.0;

  @override
  Color get progressIndicator => AppColors.addBordersActive;

  @override
  List<BoxShadow> get dialogShadows => <BoxShadow>[
    BoxShadow(
      offset: const Offset(0, 8),
      blurRadius: 16,
      color: AppColors.shadows.withValues(alpha: 0.12),
    ),
    BoxShadow(
      offset: const Offset(0, 16),
      blurRadius: 32,
      color: AppColors.shadows.withValues(alpha: 0.08),
    ),
  ];

  @override
  List<BoxShadow> get cardShadows => <BoxShadow>[
    BoxShadow(
      offset: const Offset(0, 4),
      blurRadius: 8,
      color: AppColors.shadowAccent.withValues(alpha: 0.04),
    ),
    BoxShadow(
      offset: const Offset(0, 14),
      blurRadius: 14,
      color: AppColors.shadowAccent.withValues(alpha: 0.03),
    ),
    BoxShadow(
      offset: const Offset(0, 32),
      blurRadius: 19,
      color: AppColors.shadowAccent.withValues(alpha: 0.02),
    ),
    BoxShadow(
      offset: const Offset(0, 90),
      blurRadius: 25,
      color: AppColors.shadowAccent.withValues(alpha: 0.01),
    ),
  ];

  @override
  List<BoxShadow> get cardBottomShadows => <BoxShadow>[
    BoxShadow(
      offset: const Offset(0, 1),
      blurRadius: 1,
      color: AppColors.shadows.withValues(alpha: 0.08),
    ),
    BoxShadow(
      offset: const Offset(0, 3),
      blurRadius: 3,
      color: AppColors.shadows.withValues(alpha: 0.07),
    ),
    BoxShadow(
      offset: const Offset(0, 6),
      blurRadius: 4,
      color: AppColors.shadows.withValues(alpha: 0.04),
    ),
    BoxShadow(
      offset: const Offset(0, 11),
      blurRadius: 4,
      color: AppColors.shadows.withValues(alpha: 0.01),
    ),
  ];

  @override
  List<BoxShadow> get dropdownShadows => <BoxShadow>[
    BoxShadow(
      offset: const Offset(0, 4),
      blurRadius: 6,
      color: AppColors.shadowAccent.withValues(alpha: 0.07),
    ),
    BoxShadow(
      offset: const Offset(0, 14),
      blurRadius: 10,
      color: AppColors.shadowAccent.withValues(alpha: 0.05),
    ),
  ];

  @override
  AppBackgroundTheme get background => const AppBackgroundTheme(
    main: AppColors.bgdMain,
    secondaryCard: AppColors.bgdSecondaryCard,
    hoverAD: AppColors.bgdButtonHoveredAD,
    pressedAD: AppColors.bgdButtonPressedAD,
    infoBlue: AppColors.actInfo,
    accentOrange: AppColors.addAccent,
    accentWarning: AppColors.actWarning,
    successGreen: AppColors.actSuccess,
  );

  @override
  AppRadioTheme get radio =>
      const AppRadioTheme(enabled: AppColors.bgdIconMain, disabled: AppColors.bgdIconDisabled);

  @override
  AppIconsTheme get icons => const AppIconsTheme(
    main: AppColors.bgdIconMain,
    accent: AppColors.addAccent,
    success: AppColors.actSuccess,
    disabled: AppColors.bgdIconDisabled,
    white: AppColors.bgdIconButton,
  );

  @override
  AppTextTheme get text => const AppTextTheme(
    main: AppColors.txtMain,
    secondary: AppColors.txtSecondary,
    accent: AppColors.addAccent,
    disabled: AppColors.txtDisabled,
    success: AppColors.actSuccess,
    error: AppColors.actError,
    white: AppColors.txtButtonText,
  );

  @override
  AppBorderTheme get borders => const AppBorderTheme(
    main: AppColors.addBordersMain,
    active: AppColors.addBordersActive,
    accentOrange: AppColors.addAccent,
    accentBlue: AppColors.actAccent,
    accentInfoBlue: AppColors.actInfo,
    accentError: AppColors.actError,
  );

  @override
  AppAppBarTheme get appBar => const AppAppBarTheme(
    background: AppColors.actAccent,
    logo: AppColors.bgdMain,
    icon: AppColors.bgdIconButton,
    text: AppColors.txtButtonText,
  );

  @override
  AppNavBarTheme get navBar => AppNavBarTheme(
    background: AppColors.bgdSecondaryCard,
    border: AppColors.addBordersMain,
    activeItem: AppColors.bgdIconMain,
    defaultItem: AppColors.txtSecondary,
    navBarShadows: <BoxShadow>[
      BoxShadow(
        offset: const Offset(0, 3),
        blurRadius: 4,
        color: AppColors.shadows.withValues(alpha: 0.4),
      ),
      BoxShadow(
        offset: const Offset(0, 10),
        blurRadius: 8,
        color: AppColors.shadows.withValues(alpha: 0.2),
      ),
    ],
    backgroundGradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      stops: const <double>[0, 0.3, 0.5, 1],
      colors: <Color>[
        AppColors.bgdMain.withValues(alpha: 0),
        AppColors.bgdMain.withValues(alpha: 0.6),
        AppColors.bgdMain.withValues(alpha: 0.9),
        AppColors.bgdMain,
      ],
    ),
  );

  @override
  AppElevatedButtonTheme get elevatedButton => const AppElevatedButtonTheme(
    backgroundDefault: AppElevatedButtonBackgroundTheme(
      main: AppColors.bgdButtonMain,
      red: AppColors.actError,
      accent: AppColors.addAccent,
    ),
    backgroundActive: AppElevatedButtonBackgroundTheme(
      main: AppColors.bgdButtonMain,
      red: AppColors.actError,
      accent: AppColors.addAccent,
    ),
    backgroundDisabled: AppElevatedButtonBackgroundTheme(
      main: AppColors.bgdDisabled,
      red: AppColors.bgdDisabled,
      accent: AppColors.bgdDisabled,
    ),
    contentDefault: AppElevatedButtonContentTheme(main: AppColors.txtButtonText),
    contentDisabled: AppElevatedButtonContentTheme(main: AppColors.txtDisabled),
  );

  @override
  AppOutlinedButtonTheme get outlinedButton => const AppOutlinedButtonTheme(
    borderDefault: AppOutlinedButtonBorderTheme(
      main: AppColors.bgdButtonMain,
      error: AppColors.actError,
    ),
    borderDisabled: AppOutlinedButtonBorderTheme(
      main: AppColors.bgdDisabled,
      error: AppColors.txtDisabled,
    ),
    contentDefault: AppOutlinedButtonContentTheme(
      main: AppColors.bgdButtonMain,
      error: AppColors.actError,
    ),
    contentDisabled: AppOutlinedButtonContentTheme(
      main: AppColors.txtDisabled,
      error: AppColors.txtDisabled,
    ),
  );

  const LightColorTheme();

  @override
  AppTextButtonTheme get textButton => const AppTextButtonTheme(
    contentDefault: AppTextButtonContentTheme(
      main: AppColors.bgdButtonMain,
      red: AppColors.actError,
    ),
    contentDisabled: AppTextButtonContentTheme(
      main: AppColors.txtDisabled,
      red: AppColors.txtDisabled,
    ),
  );

  @override
  AppSelectionTheme get selection => const AppSelectionTheme(
    fillSelected: AppColors.bgdIconMain,
    fillUnselected: Colors.transparent,
    border: AppColors.bgdIconMain,
    borderError: AppColors.actError,
    borderInactive: AppColors.bgdIconDisabled,
    iconOnFill: AppColors.bgdIconMain,
    halo: AppColors.actPlug,
  );

  @override
  AppTextFieldTheme get textField => const AppTextFieldTheme(
    background: AppColors.bgdMain,
    backgroundDisabled: AppColors.bgdDisabled,
    backgroundFocused: AppColors.bgdMain,
    border: AppColors.addBordersMain,
    borderFocused: AppColors.addBordersActive,
    borderError: AppColors.actError,
    text: AppColors.txtMain,
    textDisabled: AppColors.txtDisabled,
    hint: AppColors.txtSecondary,
    label: AppColors.txtSecondary,
    caption: AppColors.txtSecondary,
    cursor: AppColors.addBordersActive,
  );

  @override
  AppPinFieldTheme get pinfield => AppPinFieldTheme(
    background: AppColors.bgdMain,
    backgroundDisabled: AppColors.bgdDisabled,
    border: AppColors.addBordersMain,
    borderFocused: AppColors.addBordersActive,
    borderError: AppColors.actError,
    text: AppColors.txtMain,
    textError: AppColors.actError,
    cursor: AppColors.addBordersActive,
  );

  @override
  AppDatePickerTheme get datePicker => const AppDatePickerTheme(
    backgroundColor: AppColors.bgdMain,
    selectedDayBackgroundColor: AppColors.addAccent,
    currentDayBackgroundColor: AppColors.bgdDisabled,
    iconColor: AppColors.bgdIconMain,
    dayTextColor: AppColors.txtMain,
    disabledDayTextColor: AppColors.txtDisabled,
    selectedDayTextColor: AppColors.bgdMain,
  );

  @override
  AppLinkTheme get link =>
      const AppLinkTheme(main: AppColors.txtLink, pressed: AppColors.txtLinkPressed);

  @override
  AppToastTheme get toast => const AppToastTheme(
    success: AppColors.toastSuccess,
    warning: AppColors.toastWarning,
    error: AppColors.toastError,
    info: AppColors.toastInfo,
    neutral: AppColors.toastNeutral,
  );
}
