//
//  AppTranslations.swift
//  Welleva
//
import Foundation

enum AppTranslations {

    static func translate(_ key: String, language: String) -> String {
        switch language {
        case "Spanish": return spanish[key] ?? key
        case "French":  return french[key] ?? key
        default:        return key
        }
    }

    // MARK: - Spanish
    static let spanish: [String: String] = [
        // Tab bar & top bars
        "Home": "Inicio",
        "Device": "Dispositivo",
        "Learning": "Aprendizaje",
        "Discover": "Descubrir",
        "Settings": "Configuración",
        "Adjust Language": "Ajustar Idioma",
        "Check Fake Info": "Verificar Info",
        "Report a Scam": "Reportar Estafa",
        "Scan a Message": "Escanear Mensaje",

        // Homepage
        "Hello,": "Hola,",
        "Your Device is Protected": "Tu Dispositivo está Protegido",
        "Everything looks safe today": "Todo parece seguro hoy",
        "Check for scams or fraud": "Verificar estafas o fraudes",
        "Report Scam": "Reportar Estafa",
        "Tip of the day": "Consejo del día",
        "Never share your bank passwords or verification codes with anyone over the phone, even if they claim to be from the bank.":
            "Nunca compartas tus contraseñas bancarias o códigos de verificación por teléfono, incluso si dicen ser del banco.",

        // Language setting screen
        "Make reading easier for you": "Facilita la lectura para ti",
        "Language": "Idioma",
        "Save Changes": "Guardar Cambios",
        "Cancel": "Cancelar",
        "Hello, how can I help you?": "¡Hola, cómo puedo ayudarte?",

        // Learning centre
        "Learning Centre": "Centro de Aprendizaje",
        "Build your confidence and learn how to stay safe online.":
            "Desarrolla tu confianza y aprende a mantenerte seguro en línea.",
        "All Lessons": "Todas las Lecciones",
        "Continue Learning": "Continuar Aprendiendo",
        "Spotting Fake Text Messages": "Detectar Mensajes Falsos",

        // Report scam
        "Report It — Protect Everyone": "Repórtalo — Protege a Todos",
        "Lost Money?": "¿Perdiste Dinero?",

        // Discover
        "Active Scam Alert": "Alerta de Estafa Activa",
        "LATEST NEWS": "ÚLTIMAS NOTICIAS",

        // Device
        "No threats detected on this device": "No se detectaron amenazas en este dispositivo",
        "YOUR CHECKS — LAST 7 DAYS": "TUS VERIFICACIONES — ÚLTIMOS 7 DÍAS",
        "No checks this week": "Sin verificaciones esta semana",
    ]

    // MARK: - French
    static let french: [String: String] = [
        // Tab bar & top bars
        "Home": "Accueil",
        "Device": "Appareil",
        "Learning": "Apprentissage",
        "Discover": "Découvrir",
        "Settings": "Paramètres",
        "Adjust Language": "Ajuster la Langue",
        "Check Fake Info": "Vérifier les Infos",
        "Report a Scam": "Signaler une Arnaque",
        "Scan a Message": "Scanner un Message",

        // Homepage
        "Hello,": "Bonjour,",
        "Your Device is Protected": "Votre Appareil est Protégé",
        "Everything looks safe today": "Tout semble sûr aujourd'hui",
        "Check for scams or fraud": "Vérifier les arnaques ou fraudes",
        "Report Scam": "Signaler Arnaque",
        "Tip of the day": "Conseil du jour",
        "Never share your bank passwords or verification codes with anyone over the phone, even if they claim to be from the bank.":
            "Ne partagez jamais vos mots de passe bancaires ou codes de vérification par téléphone, même s'ils prétendent être de la banque.",

        // Language setting screen
        "Make reading easier for you": "Facilitez la lecture pour vous",
        "Language": "Langue",
        "Save Changes": "Sauvegarder",
        "Cancel": "Annuler",
        "Hello, how can I help you?": "Bonjour, comment puis-je vous aider ?",

        // Learning centre
        "Learning Centre": "Centre d'Apprentissage",
        "Build your confidence and learn how to stay safe online.":
            "Renforcez votre confiance et apprenez à rester en sécurité en ligne.",
        "All Lessons": "Toutes les Leçons",
        "Continue Learning": "Continuer l'Apprentissage",
        "Spotting Fake Text Messages": "Détecter les Faux Messages",

        // Report scam
        "Report It — Protect Everyone": "Signalez-le — Protégez tout le monde",
        "Lost Money?": "Perdu de l'Argent ?",

        // Discover
        "Active Scam Alert": "Alerte d'Arnaque Active",
        "LATEST NEWS": "DERNIÈRES NOUVELLES",

        // Device
        "No threats detected on this device": "Aucune menace détectée sur cet appareil",
        "YOUR CHECKS — LAST 7 DAYS": "VOS VÉRIFICATIONS — 7 DERNIERS JOURS",
        "No checks this week": "Aucune vérification cette semaine",
    ]
}
