//
//  LessonData.swift
//  Welleva
//
import SwiftUI

let allLessons: [Lesson] = [
    Lesson(
        title: "Fake Text Messages",
        subtitle: "Learn how to spot suspicious SMS messages",
        icon: "message.fill",
        iconColor: .purple,
        iconBackground: Color.purple.opacity(0.15),
        introduction: "Fake text messages are designed to trick you into clicking a dangerous link, sharing personal information or sending money.",
        warningSigns: [
            "The message creates urgency or fear",
            "It asks you to click an unfamiliar link",
            "It requests passwords or banking details",
            "The sender's number looks unusual",
            "The offer sounds too good to be true"
        ],
        safetyTips: [
            "Do not click links in unexpected messages",
            "Contact the organisation using its official website",
            "Block and report suspicious numbers",
            "Never share security codes by text"
        ],
        quizQuestion: "Which message is most likely to be a scam?",
        quizOptionA: "Your parcel could not be delivered. Pay $2.95 via auspost-delivery247.com now or your parcel will be returned.",
        quizOptionB: "Hi! Your dentist appointment is confirmed for 10am tomorrow. Reply STOP to cancel reminders.",
        quizCorrectAnswer: "A",
        quizCorrectFeedback: "Correct! Message A uses urgency, asks for unexpected payment, and links to a fake website — not Australia Post's real domain.",
        quizIncorrectFeedback: "Look for urgent language, unexpected payment requests, and suspicious links. Message A has all three."
    ),
    Lesson(
        title: "Phishing Emails",
        subtitle: "Recognise fake emails and dangerous links",
        icon: "envelope.fill",
        iconColor: .blue,
        iconBackground: Color.blue.opacity(0.15),
        introduction: "Phishing emails pretend to come from trusted organisations such as banks, delivery companies or government services.",
        warningSigns: [
            "The sender's email address looks incorrect",
            "The email contains spelling or grammar mistakes",
            "It asks you to verify personal information",
            "It contains unexpected attachments",
            "The link does not match the official website"
        ],
        safetyTips: [
            "Check the sender's full email address carefully",
            "Do not open unexpected attachments",
            "Visit the organisation's website directly",
            "Delete and report suspicious emails"
        ],
        quizQuestion: "Which email is most likely to be phishing?",
        quizOptionA: "Your Netflix subscription has expired. Click here — netfl1x-billing.com — to reactivate within 24 hours or lose access.",
        quizOptionB: "Your monthly bank statement is now ready to view securely in your online banking portal.",
        quizCorrectAnswer: "A",
        quizCorrectFeedback: "Correct! 'netfl1x-billing.com' uses a '1' instead of 'i' — a fake URL designed to look like Netflix. The urgency is also a red flag.",
        quizIncorrectFeedback: "Look carefully at the URL. In Option A, 'netfl1x' uses a '1' instead of 'i' — a fake website pretending to be Netflix."
    ),
    Lesson(
        title: "Phone Call Scams",
        subtitle: "Learn the warning signs of scam calls",
        icon: "phone.fill",
        iconColor: .green,
        iconBackground: Color.green.opacity(0.15),
        introduction: "Scam callers may pretend to be from your bank, the police, the government or a well-known company.",
        warningSigns: [
            "The caller pressures you to act immediately",
            "They ask for banking or personal details",
            "They request gift cards or unusual payments",
            "They threaten arrest, fines or account closure",
            "They ask you to install remote-access software"
        ],
        safetyTips: [
            "Hang up if you feel pressured",
            "Call the organisation using its official number",
            "Never share one-time security codes",
            "Block suspicious callers"
        ],
        quizQuestion: "Which caller is most likely to be a scammer?",
        quizOptionA: "Hi, this is the ATO. Your tax file has been flagged for fraud. You must pay $500 in iTunes gift cards immediately or be arrested.",
        quizOptionB: "Hello, I'm calling from your GP clinic to remind you about your appointment this Friday at 2pm.",
        quizCorrectAnswer: "A",
        quizCorrectFeedback: "Correct! Real government agencies never demand payment via gift cards or threaten immediate arrest. Always hang up and call back on an official number.",
        quizIncorrectFeedback: "Government agencies never request gift card payments or threaten immediate arrest. Caller A is using threats and unusual payment — that's always a scam."
    ),
    Lesson(
        title: "Fake Websites",
        subtitle: "Check whether a website looks trustworthy",
        icon: "globe",
        iconColor: .orange,
        iconBackground: Color.orange.opacity(0.15),
        introduction: "Fake websites imitate real businesses to steal payment information, login details or personal information.",
        warningSigns: [
            "The website address is misspelled",
            "Prices are unusually low",
            "The site has poor spelling or design",
            "There is no contact or return information",
            "The payment method appears unusual"
        ],
        safetyTips: [
            "Check the website address carefully before entering any information",
            "Search for independent customer reviews",
            "Use secure and trusted payment methods",
            "Avoid entering personal information on unfamiliar sites"
        ],
        quizQuestion: "Which website link looks suspicious?",
        quizOptionA: "www.amaz0n-secure-checkout.net/pay-now",
        quizOptionB: "www.amazon.com.au/checkout",
        quizCorrectAnswer: "A",
        quizCorrectFeedback: "Correct! 'amaz0n' uses a zero instead of the letter 'o', and uses '.net' instead of '.com.au' — a classic fake website trick.",
        quizIncorrectFeedback: "Look closely at the spelling. In Option A, 'amaz0n' uses a zero — a trick scammers use to look like the real Amazon."
    ),
    Lesson(
        title: "Banking Scams",
        subtitle: "Protect your money and personal details",
        icon: "creditcard.fill",
        iconColor: .pink,
        iconBackground: Color.pink.opacity(0.15),
        introduction: "Banking scammers may impersonate your bank and claim there is suspicious activity on your account.",
        warningSigns: [
            "You are asked to transfer money to a 'safe account'",
            "Someone asks for your PIN or password",
            "You receive an unexpected security-code request",
            "The caller pressures you to stay on the line",
            "The message contains an unfamiliar banking link"
        ],
        safetyTips: [
            "Banks will never ask for your password or PIN",
            "Contact your bank using the number on your card",
            "Do not transfer money because of an unexpected call",
            "Report suspicious transactions immediately"
        ],
        quizQuestion: "Which request is most likely from a scammer?",
        quizOptionA: "This is CommBank security. We've detected fraud. Please transfer your funds to this safe account we've created for you immediately.",
        quizOptionB: "Your CommBank app has a security update available. Please update at your convenience via the App Store.",
        quizCorrectAnswer: "A",
        quizCorrectFeedback: "Correct! Banks never ask you to transfer money to a 'safe account'. This is the most common banking scam tactic in Australia.",
        quizIncorrectFeedback: "Real banks never ask you to move money to another account. Option A is a textbook 'safe account' banking scam."
    )
]
