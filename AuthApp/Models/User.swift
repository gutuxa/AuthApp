//
//  User.swift
//  AuthApp
//
//  Created by Oksana Tugusheva on 03.04.2021.
//

struct User {
    let username: String
    let password: String
    
    static func getUser() -> User {
        User(
            username: "user",
            password: "password"
        )
    }
    
    func getPerson() -> Person {
        Person(
            firstName: "Oksana",
            lastName: "Tugusheva",
            skills: "I graduated from university with a degree in software. I started working as a front-end engineer. I have mastered such technologies as html, css, javascript. I try to make user-friendly applications.😉",
            jobs: [
                Job(
                    title: "Banki.ru",
                    description: "Developed and maintained section «Insurance». Created insurance calculator."
                ),
                Job(
                    title: "Revolut.com",
                    description: "Created public landing. Developed backoffice application."
                ),
                Job(
                    title: "Currency.com",
                    description: "Developed media public site and news builder."
                )
            ],
            hobbies: "I like ballet, snow boarding, collect succulents."
        )
    }
}

struct Person {
    let firstName: String
    let lastName: String
    let skills: String
    let jobs: [Job]
    let hobbies: String
}

struct Job {
    let title: String
    let description: String
}
