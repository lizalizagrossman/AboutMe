//
//  User.swift
//  LoginPage
//
//  Created by Elizabeth on 02/03/2023.
//

struct User {
    let userName: String
    let password: String
    let personalInfo: Person
    
    static func getUserInfo() -> User {
            User(
                userName: "user",
                password: "user",
                personalInfo: Person.getPerson()
                )
    }
}

struct Person {
    let name: String
    let surname: String
    let job: String
    let favouriteAnimal: String
    let textInfo: String
    let photo: String
    let company: Company
    
    var fullName: String {
        "\(name) \(surname)"
    }
    
    static func getPerson() -> Person {
            Person(
                name: "Liza",
                surname: "Grossman",
                job: "Marketing specialist",
                favouriteAnimal: "🐶",
                textInfo: "Я креведко",
                photo: "Liza Grossman",
                company: Company.getCompany()
            )
    }
}

struct Company {
    let title: String
    let jobTitle: JobTitle
    let department: Department
    
    static func getCompany() -> Company{
        Company(
            title: "Ikea",
            jobTitle: .specialist,
            department: .marketing
        )
    }
}

enum JobTitle: String {
    case specialist = "specialist"
    case manager = "manager"
}

enum Department: String {
    case marketing = "Marketing"
    case managemant = "Management"
}


