//
//  Lesson.swift
//  Welleva
//
import SwiftUI

struct Lesson: Identifiable {
    let id = UUID()
    let title: String
    let subtitle: String
    let icon: String
    let iconColor: Color
    let iconBackground: Color
    let introduction: String
    let warningSigns: [String]
    let safetyTips: [String]
    let quizQuestion: String
    let quizOptionA: String
    let quizOptionB: String
    let quizCorrectAnswer: String   // "A" or "B"
    let quizCorrectFeedback: String
    let quizIncorrectFeedback: String
}

extension Lesson: Hashable {
    static func == (lhs: Lesson, rhs: Lesson) -> Bool { lhs.id == rhs.id }
    func hash(into hasher: inout Hasher) { hasher.combine(id) }
}
