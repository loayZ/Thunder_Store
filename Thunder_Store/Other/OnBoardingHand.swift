//
//  OnBoardingHand.swift
//  Thunder_Store
//
//  Created by loay on 17/01/2023.
//
import OnboardKit


var onboardingPages: [OnboardPage] = {
  let pageOne = OnboardPage(title: "Welcome to Thunder Store",
                            imageName: "",
                            description: "You will find most of electronics Devices and accessories in one app.")

  let pageTwo = OnboardPage(title: "Welcome to Thunder Store",
                            imageName: "",
    description: "Fast and affordable delivery fees.")

  let pageThree = OnboardPage(title: "Welcome to Thunder Store",
                              imageName: "",
    description: "Browse & discover new products with best prices.")

  

  return [pageOne, pageTwo, pageThree]
}()





