//
//  EventRepository.swift
//  nano-challenge-1
//
//  Created by Rafael Venetikides on 30/07/25.
//

struct EventRepository {
    static func allEvents() -> [String: GameEvent] {
        return [
            "start": GameEvent(
                id: "start",
                type: .dialogue(
                    DialogueNode(
                        id: "start",
                        characterName: "Talking Cricket",
                        leftCharacterImage: "pinocchiospeak",
                        rightCharacterImage: "cricketspeak",
                        text: "Pinoccio, you ran away from home and caused trouble around the village, Geppetto was arrested for that. Naughty children like you get punished, sooner or later!",
                        options: [
                            DialogueOption(text: "Get out of here, I don't want to hear your moral lessons!", nextEventId: "cricketbattle"),
                        ]
                    )
                ),
                nextEventId: nil
            ),
            "cricketbattle" : GameEvent(
                id: "cricketbattle",
                type: .battle(
                    Character(
                        name: "Talking Cricket",
                        totalHealth: 40,
                        currentHealth: 40,
                        shield: 0,
                        attackPower: 5,
                        image: "cricket"
                    )
                ),
                nextEventId: "aftercricketbattle"
            ),
            "aftercricketbattle": GameEvent(
                id: "aftercricketbattle",
                type: .dialogue(
                    DialogueNode(
                        id: "aftercricketbattle",
                        characterName: "Talking Cricket",
                        leftCharacterImage: "pinocchiospeak",
                        rightCharacterImage: "cricketspeak",
                        text: "Okay okay, stop fighting, i yield. We need to go find Geppeto. Let's go ask around the village.",
                        options: [DialogueOption(
                                    text: "Ok, let's find some answers.",
                                    nextEventId: "puppeterencounter"
                        ),
                                  DialogueOption(
                                    text: "*Throw a hammer at him*",
                                    nextEventId: "foxandcatencounter"
                                  )
                        ]
                    )
                ),
                nextEventId: nil,
            ),
            "puppeterencounter": GameEvent(
                id: "puppeterencounter",
                type: .dialogue(
                    DialogueNode(
                        id: "puppeterencounter",
                        characterName: "Puppet Master",
                        leftCharacterImage: "pinocchiospeak",
                        rightCharacterImage: "puppeterspeak",
                        text: "Hi kid! Wandering around looking for you father? Why not take a break and enjoy the circus show? I'm sure you are gonna love it!",
                        options: [
                            DialogueOption(text: "Geppeto can wait, let's go to the circus", nextEventId: "ending1"),
                            DialogueOption(text: "No, I need to stay on track and find my father", nextEventId: "puppeterbattle")
                        ]
                    )
                ),
                nextEventId: nil
            ),
            "puppeterbattle": GameEvent(
                id: "puppeterbattle",
                type: .battle(
                    Character(
                        name: "Puppet Master",
                        totalHealth: 60,
                        currentHealth: 60,
                        shield: 0,
                        attackPower: 10,
                        image: "puppetmaster"
                    )
                ),
                nextEventId: "afterpuppeter"
            ),
            "afterpuppeter": GameEvent(
                id: "afterpuppeter",
                type: .dialogue(
                    DialogueNode(
                        id: "afterpuppeter",
                        characterName: "Puppet Master",
                        leftCharacterImage: "pinocchiospeak",
                        rightCharacterImage: "puppeterspeak",
                        text: "Okay Okay, I know where Gepeto is! He was taken by the Whale! They are in the docs!",
                        options: [
                            DialogueOption(text: "I gotta hurry!", nextEventId: "whaleencounter"),
                        ]
                    )
                ),
                nextEventId: nil
            ),
            "whaleencounter": GameEvent(
                id: "whaleencounter",
                type: .dialogue(
                    DialogueNode(
                        id: "whaleencounter",
                        characterName: "Whale",
                        leftCharacterImage: "pinocchiospeak",
                        rightCharacterImage: "whalespeak",
                        text: "You came after your father? I have him, but to get him, first you are gonna have to defeat me!",
                        options: [
                            DialogueOption(
                                text: "Let's fight fish!",
                                nextEventId: "whalebattle"
                            )
                        ]
                    )
                ),
                nextEventId: nil
            ),
            "whalebattle": GameEvent(
                id: "whalebattle",
                type: .battle(
                    Character(
                        name: "Whale",
                        totalHealth: 100,
                        currentHealth: 100,
                        shield: 0,
                        attackPower: 12,
                        image: "whale"
                    )
                ),
                nextEventId: "whaledefeat"
            ),
            "whaledefeat": GameEvent(
                id: "whaledefeat",
                type: .dialogue(
                    DialogueNode(
                        id: "whaledefeat",
                        characterName: "Narator",
                        leftCharacterImage: "",
                        rightCharacterImage: "",
                        text: "You saved gepeto! They went back home and lived happily ever after!",
                        options: []
                    )
                ),
                nextEventId: nil
            ),
            "foxandcatencounter": GameEvent(
                id: "foxandcatencounter",
                type: .dialogue(
                    DialogueNode(
                        id: "foxandcatencounter",
                        characterName: "Fox and Cat",
                        leftCharacterImage: "pinocchiospeak",
                        rightCharacterImage: "foxandcatspeak",
                        text: "Hey kid, those are some nice coins you've got, what about sharing them with us?",
                        options: [
                            DialogueOption(
                                text: "No! they are mine!",
                                nextEventId: "foxandcatbattle"
                            )
                        ]
                    )
                ),
                nextEventId: nil
            ),
            "foxandcatbattle": GameEvent(
                id: "foxandcatbattle",
                type: .battle(
                    Character(
                        name: "Fox and Cat",
                        totalHealth: 60,
                        currentHealth: 60,
                        shield: 0,
                        attackPower: 10,
                        image: "foxandcat"
                    )
                ),
                nextEventId: "foxandcatdefeat"
            ),
            "foxandcatdefeat": GameEvent(
                id: "foxandcatdefeat",
                type: .dialogue(
                    DialogueNode(
                        id: "foxandcatdefeat",
                        characterName: "Fox and Cat",
                        leftCharacterImage: "pinocchiospeak",
                        rightCharacterImage: "foxandcatspeak",
                        text: "Okey, you are too strong and smart for us! We will leave you alone! But don't burry those coins in the Field of Miracles, or you will have trees of gold sprouting around.",
                        options: [
                            DialogueOption(
                                text: "That seems like a smart idea!",
                                nextEventId: "ghostencounter"
                            ),
                            DialogueOption(
                                text: "I gotta find my father, get out of my way!",
                                nextEventId: "whaleencounter"
                            )
                        ]
                    )
                ),
                nextEventId: nil
            ),
            "ghostencounter": GameEvent(
                id: "ghostencounter",
                type: .dialogue(
                    DialogueNode(
                        id: "ghostencounter",
                        characterName: "Ghost cricket",
                        leftCharacterImage: "pinocchiospeak",
                        rightCharacterImage: "ghostspeak",
                        text: "You believed those two decievers and now you got robbed!. You have nothing left, and I came to get my revenge!",
                        options: [
                            DialogueOption(
                                text: "Fight me insect!",
                                nextEventId: "ghostbattle"
                            )
                        ]
                    )
                ),
                nextEventId: nil
            ),
            "ghostbattle": GameEvent(
                id: "ghostbattle",
                type: .battle(
                    Character(
                        name: "Ghost Cricket",
                        totalHealth: 90,
                        currentHealth: 90,
                        shield: 0,
                        attackPower: 12,
                        image: "ghost"
                    )
                ),
                nextEventId: "ghostdefeat"
            ),
            "ghostdefeat": GameEvent(
                id: "ghostdefeat",
                type: .dialogue(
                    DialogueNode(
                        id: "ghostdefeat",
                        characterName: "Ghost Cricket",
                        leftCharacterImage: "pinocchiospeak",
                        rightCharacterImage: "ghostspeak",
                        text: "You fool! I'm a ghost! I cannot be defeated! We will battle forever!",
                        options: []
                    )
                ),
                nextEventId: nil
            ),
            "ending1": GameEvent(
                id: "ending1",
                type: .dialogue(
                    DialogueNode(
                        id: "ending1",
                        characterName: "Narrator",
                        leftCharacterImage: "",
                        rightCharacterImage: "",
                        text: "Pinoccio went to the circus and lost track of time, forgetting all about Gepeto!",
                        options: []
                    )
                ),
                nextEventId: nil
            )
        ]
    }
}
