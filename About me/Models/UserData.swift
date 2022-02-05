//
//  UserData.swift
//  HW-2.3
//
//  Created by Виталий Подшибякин on 02.02.2022.
//


struct UserData {
    let user: String
    let password: String
    let person: Person
    
    static func getPerson() -> UserData {
            UserData(
                user: "user",
                password: "password",
                person: Person(
                    firstName: "Vitaly",
                    secondName: "Podshibyakin",
                    definition: "New user")
            )
    }

}

struct Person {
    let firstName: String
    let secondName: String
    let definition: String
}



