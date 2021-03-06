//
// This is a generated file, do not edit!
// Generated by R.swift, see https://github.com/mac-cain13/R.swift
//

import Foundation
import Rswift
import UIKit

/// This `R` struct is generated and contains references to static resources.
struct R: Rswift.Validatable {
  fileprivate static let applicationLocale = hostingBundle.preferredLocalizations.first.flatMap { Locale(identifier: $0) } ?? Locale.current
  fileprivate static let hostingBundle = Bundle(for: R.Class.self)

  /// Find first language and bundle for which the table exists
  fileprivate static func localeBundle(tableName: String, preferredLanguages: [String]) -> (Foundation.Locale, Foundation.Bundle)? {
    // Filter preferredLanguages to localizations, use first locale
    var languages = preferredLanguages
      .map { Locale(identifier: $0) }
      .prefix(1)
      .flatMap { locale -> [String] in
        if hostingBundle.localizations.contains(locale.identifier) {
          if let language = locale.languageCode, hostingBundle.localizations.contains(language) {
            return [locale.identifier, language]
          } else {
            return [locale.identifier]
          }
        } else if let language = locale.languageCode, hostingBundle.localizations.contains(language) {
          return [language]
        } else {
          return []
        }
      }

    // If there's no languages, use development language as backstop
    if languages.isEmpty {
      if let developmentLocalization = hostingBundle.developmentLocalization {
        languages = [developmentLocalization]
      }
    } else {
      // Insert Base as second item (between locale identifier and languageCode)
      languages.insert("Base", at: 1)

      // Add development language as backstop
      if let developmentLocalization = hostingBundle.developmentLocalization {
        languages.append(developmentLocalization)
      }
    }

    // Find first language for which table exists
    // Note: key might not exist in chosen language (in that case, key will be shown)
    for language in languages {
      if let lproj = hostingBundle.url(forResource: language, withExtension: "lproj"),
         let lbundle = Bundle(url: lproj)
      {
        let strings = lbundle.url(forResource: tableName, withExtension: "strings")
        let stringsdict = lbundle.url(forResource: tableName, withExtension: "stringsdict")

        if strings != nil || stringsdict != nil {
          return (Locale(identifier: language), lbundle)
        }
      }
    }

    // If table is available in main bundle, don't look for localized resources
    let strings = hostingBundle.url(forResource: tableName, withExtension: "strings", subdirectory: nil, localization: nil)
    let stringsdict = hostingBundle.url(forResource: tableName, withExtension: "stringsdict", subdirectory: nil, localization: nil)

    if strings != nil || stringsdict != nil {
      return (applicationLocale, hostingBundle)
    }

    // If table is not found for requested languages, key will be shown
    return nil
  }

  /// Load string from Info.plist file
  fileprivate static func infoPlistString(path: [String], key: String) -> String? {
    var dict = hostingBundle.infoDictionary
    for step in path {
      guard let obj = dict?[step] as? [String: Any] else { return nil }
      dict = obj
    }
    return dict?[key] as? String
  }

  static func validate() throws {
    try intern.validate()
  }

  #if os(iOS) || os(tvOS)
  /// This `R.storyboard` struct is generated, and contains static references to 2 storyboards.
  struct storyboard {
    /// Storyboard `LaunchScreen`.
    static let launchScreen = _R.storyboard.launchScreen()
    /// Storyboard `Main`.
    static let main = _R.storyboard.main()

    #if os(iOS) || os(tvOS)
    /// `UIStoryboard(name: "LaunchScreen", bundle: ...)`
    static func launchScreen(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.launchScreen)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIStoryboard(name: "Main", bundle: ...)`
    static func main(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.main)
    }
    #endif

    fileprivate init() {}
  }
  #endif

  /// This `R.color` struct is generated, and contains static references to 1 colors.
  struct color {
    /// Color `AccentColor`.
    static let accentColor = Rswift.ColorResource(bundle: R.hostingBundle, name: "AccentColor")

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "AccentColor", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func accentColor(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.accentColor, compatibleWith: traitCollection)
    }
    #endif

    #if os(watchOS)
    /// `UIColor(named: "AccentColor", bundle: ..., traitCollection: ...)`
    @available(watchOSApplicationExtension 4.0, *)
    static func accentColor(_: Void = ()) -> UIKit.UIColor? {
      return UIKit.UIColor(named: R.color.accentColor.name)
    }
    #endif

    fileprivate init() {}
  }

  /// This `R.info` struct is generated, and contains static references to 1 properties.
  struct info {
    struct uiApplicationSceneManifest {
      static let _key = "UIApplicationSceneManifest"
      static let uiApplicationSupportsMultipleScenes = false

      struct uiSceneConfigurations {
        static let _key = "UISceneConfigurations"

        struct uiWindowSceneSessionRoleApplication {
          struct defaultConfiguration {
            static let _key = "Default Configuration"
            static let uiSceneConfigurationName = infoPlistString(path: ["UIApplicationSceneManifest", "UISceneConfigurations", "UIWindowSceneSessionRoleApplication", "Default Configuration"], key: "UISceneConfigurationName") ?? "Default Configuration"
            static let uiSceneDelegateClassName = infoPlistString(path: ["UIApplicationSceneManifest", "UISceneConfigurations", "UIWindowSceneSessionRoleApplication", "Default Configuration"], key: "UISceneDelegateClassName") ?? "$(PRODUCT_MODULE_NAME).SceneDelegate"
            static let uiSceneStoryboardFile = infoPlistString(path: ["UIApplicationSceneManifest", "UISceneConfigurations", "UIWindowSceneSessionRoleApplication", "Default Configuration"], key: "UISceneStoryboardFile") ?? "Main"

            fileprivate init() {}
          }

          fileprivate init() {}
        }

        fileprivate init() {}
      }

      fileprivate init() {}
    }

    fileprivate init() {}
  }

  /// This `R.string` struct is generated, and contains static references to 1 localization tables.
  struct string {
    /// This `R.string.localizable` struct is generated, and contains static references to 8 localization keys.
    struct localizable {
      /// en translation: Don't have an account? Sign up
      ///
      /// Locales: en, ru
      static let dontHaveAccoun_button = Rswift.StringResource(key: "dontHaveAccoun_button", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en", "ru"], comment: nil)
      /// en translation: Sign in
      ///
      /// Locales: en, ru
      static let signInButtonFromSignUp_button = Rswift.StringResource(key: "signInButtonFromSignUp_button", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en", "ru"], comment: nil)
      /// en translation: Sign in
      ///
      /// Locales: en, ru
      static let signInbutton_button = Rswift.StringResource(key: "signInbutton_button", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en", "ru"], comment: nil)
      /// en translation: Sign in form
      ///
      /// Locales: en, ru
      static let signInForm_label = Rswift.StringResource(key: "signInForm_label", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en", "ru"], comment: nil)
      /// en translation: Sign up
      ///
      /// Locales: en, ru
      static let signUpButton = Rswift.StringResource(key: "signUpButton", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en", "ru"], comment: nil)
      /// en translation: Sign up form
      ///
      /// Locales: en, ru
      static let signUpForm_label = Rswift.StringResource(key: "signUpForm_label", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en", "ru"], comment: nil)
      /// en translation: We hope you're enjoying our app as much as we've enjoyed building it!
      ///
      /// Locales: en, ru
      static let alert_message = Rswift.StringResource(key: "alert_message", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en", "ru"], comment: nil)
      /// en translation: Welcome back ????
      ///
      /// Locales: en, ru
      static let alert_title = Rswift.StringResource(key: "alert_title", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en", "ru"], comment: nil)

      /// en translation: Don't have an account? Sign up
      ///
      /// Locales: en, ru
      static func dontHaveAccoun_button(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("dontHaveAccoun_button", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "dontHaveAccoun_button"
        }

        return NSLocalizedString("dontHaveAccoun_button", bundle: bundle, comment: "")
      }

      /// en translation: Sign in
      ///
      /// Locales: en, ru
      static func signInButtonFromSignUp_button(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("signInButtonFromSignUp_button", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "signInButtonFromSignUp_button"
        }

        return NSLocalizedString("signInButtonFromSignUp_button", bundle: bundle, comment: "")
      }

      /// en translation: Sign in
      ///
      /// Locales: en, ru
      static func signInbutton_button(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("signInbutton_button", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "signInbutton_button"
        }

        return NSLocalizedString("signInbutton_button", bundle: bundle, comment: "")
      }

      /// en translation: Sign in form
      ///
      /// Locales: en, ru
      static func signInForm_label(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("signInForm_label", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "signInForm_label"
        }

        return NSLocalizedString("signInForm_label", bundle: bundle, comment: "")
      }

      /// en translation: Sign up
      ///
      /// Locales: en, ru
      static func signUpButton(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("signUpButton", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "signUpButton"
        }

        return NSLocalizedString("signUpButton", bundle: bundle, comment: "")
      }

      /// en translation: Sign up form
      ///
      /// Locales: en, ru
      static func signUpForm_label(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("signUpForm_label", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "signUpForm_label"
        }

        return NSLocalizedString("signUpForm_label", bundle: bundle, comment: "")
      }

      /// en translation: We hope you're enjoying our app as much as we've enjoyed building it!
      ///
      /// Locales: en, ru
      static func alert_message(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("alert_message", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "alert_message"
        }

        return NSLocalizedString("alert_message", bundle: bundle, comment: "")
      }

      /// en translation: Welcome back ????
      ///
      /// Locales: en, ru
      static func alert_title(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("alert_title", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "alert_title"
        }

        return NSLocalizedString("alert_title", bundle: bundle, comment: "")
      }

      fileprivate init() {}
    }

    fileprivate init() {}
  }

  fileprivate struct intern: Rswift.Validatable {
    fileprivate static func validate() throws {
      try _R.validate()
    }

    fileprivate init() {}
  }

  fileprivate class Class {}

  fileprivate init() {}
}

struct _R: Rswift.Validatable {
  static func validate() throws {
    #if os(iOS) || os(tvOS)
    try storyboard.validate()
    #endif
  }

  #if os(iOS) || os(tvOS)
  struct storyboard: Rswift.Validatable {
    static func validate() throws {
      #if os(iOS) || os(tvOS)
      try launchScreen.validate()
      #endif
      #if os(iOS) || os(tvOS)
      try main.validate()
      #endif
    }

    #if os(iOS) || os(tvOS)
    struct launchScreen: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = UIKit.UIViewController

      let bundle = R.hostingBundle
      let name = "LaunchScreen"

      static func validate() throws {
        if #available(iOS 11.0, tvOS 11.0, *) {
        }
      }

      fileprivate init() {}
    }
    #endif

    #if os(iOS) || os(tvOS)
    struct main: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = UIKit.UINavigationController

      let bundle = R.hostingBundle
      let content = StoryboardViewControllerResource<Content>(identifier: "Content")
      let name = "Main"
      let signIn = StoryboardViewControllerResource<SignIn>(identifier: "SignIn")
      let signUp = StoryboardViewControllerResource<SignUp>(identifier: "SignUp")

      func content(_: Void = ()) -> Content? {
        return UIKit.UIStoryboard(resource: self).instantiateViewController(withResource: content)
      }

      func signIn(_: Void = ()) -> SignIn? {
        return UIKit.UIStoryboard(resource: self).instantiateViewController(withResource: signIn)
      }

      func signUp(_: Void = ()) -> SignUp? {
        return UIKit.UIStoryboard(resource: self).instantiateViewController(withResource: signUp)
      }

      static func validate() throws {
        if #available(iOS 13.0, *) { if UIKit.UIImage(systemName: "eye") == nil { throw Rswift.ValidationError(description: "[R.swift] System image named 'eye' is used in storyboard 'Main', but couldn't be loaded.") } }
        if #available(iOS 13.0, *) { if UIKit.UIImage(systemName: "scribble.variable") == nil { throw Rswift.ValidationError(description: "[R.swift] System image named 'scribble.variable' is used in storyboard 'Main', but couldn't be loaded.") } }
        if #available(iOS 11.0, tvOS 11.0, *) {
        }
        if _R.storyboard.main().content() == nil { throw Rswift.ValidationError(description:"[R.swift] ViewController with identifier 'content' could not be loaded from storyboard 'Main' as 'Content'.") }
        if _R.storyboard.main().signIn() == nil { throw Rswift.ValidationError(description:"[R.swift] ViewController with identifier 'signIn' could not be loaded from storyboard 'Main' as 'SignIn'.") }
        if _R.storyboard.main().signUp() == nil { throw Rswift.ValidationError(description:"[R.swift] ViewController with identifier 'signUp' could not be loaded from storyboard 'Main' as 'SignUp'.") }
      }

      fileprivate init() {}
    }
    #endif

    fileprivate init() {}
  }
  #endif

  fileprivate init() {}
}
