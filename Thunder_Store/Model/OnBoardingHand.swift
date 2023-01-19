//
//  OnBoardingHand.swift
//  Thunder_Store
//
//  Created by loay on 17/01/2023.
//
import OnboardKit


var onboardingPages: [OnboardPage] = {
  let pageOne = OnboardPage(title: "Welcome to Habitat",
                            imageName: "icons8-smartphones-96",
                            description: "Habitat is an easy to use productivity app designed to keep you motivated.")

  let pageTwo = OnboardPage(title: "Habit Entries",
                            imageName: "Onboarding2",
    description: "For each of your habits an entry is created for every day you need to complete it.")

  let pageThree = OnboardPage(title: "Marking and Tracking",
                              imageName: "Onboarding3",
    description: "By marking entries as Done you can track your progress on the path to success.")

  let pageFour = OnboardPage(title: "Notifications",
                             imageName: "Onboarding4",
                             description: "Turn on notifications to get reminders and keep up with your goals.",
                             advanceButtonTitle: "Decide Later"
            )

  let pageFive = OnboardPage(title: "All Ready",
                             imageName: "Onboarding5",
    description: "You are all set up and ready to use Habitat. Begin by adding your first habit.",
    advanceButtonTitle: "Done")

  return [pageOne, pageTwo, pageThree, pageFour, pageFive]
}()





