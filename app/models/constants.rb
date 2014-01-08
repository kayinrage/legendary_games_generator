class Constants
    HEROES = [
        {name: 'Black Widow', team: 'Avenger', expansion: 'Core'},
        {name: 'Captain America', team: 'Avengers', expansion: 'Core'},
        {name: 'Cyclops', team: 'X-Men', expansion: 'Core'},
        {name: 'Deadpool', team: 'None', expansion: 'Core'},
        {name: 'Emma Frost', team: 'X-Men', expansion: 'Core'},
        {name: 'Gambit', team: 'X-Men', expansion: 'Core'},
        {name: 'Hawkeye', team: 'Avengers', expansion: 'Core'},
        {name: 'Hulk', team: 'Avengers', expansion: 'Core'},
        {name: 'Iron Man', team: 'Avengers', expansion: 'Core'},
        {name: 'Nick Fury', team: 'S.H.I.E.L.D.', expansion: 'Core'},
        {name: 'Rogue', team: 'X-Men', expansion: 'Core'},
        {name: 'Spider-man', team: 'Spider Friends', expansion: 'Core'},
        {name: 'Storm', team: 'X-Men', expansion: 'Core'},
        {name: 'Thor', team: 'Avengers', expansion: 'Core'},
        {name: 'Wolverine', team: 'X-Men', expansion: 'Core'},
    ]

    PLAYERS = [
        {heroes: 3, villains: 1, henchmen: 1, bystandars: 1, master_strikes: 1},
        {heroes: 5, villains: 2, henchmen: 1, bystandars: 2, master_strikes: 5},
        {heroes: 5, villains: 3, henchmen: 1, bystandars: 8, master_strikes: 5},
        {heroes: 5, villains: 3, henchmen: 2, bystandars: 8, master_strikes: 5},
        {heroes: 6, villains: 4, henchmen: 2, bystandars: 12, master_strikes: 5},
    ]

    MASTERMINDS = [
        {name: 'Red Skull', villains: 'HYDRA', power: 7, expansion: 'Core'},
        {name: 'Magneto', villains: 'Brotherhood', power: 8, expansion: 'Core'},
        {name: 'Dr. Doom', henchmen: 'Doombot Legion', power: 9, expansion: 'Core'},
        {name: 'Loki', villains: 'Enemies Of Asgard', power: 10, expansion: 'Core'},
    ]

    HENCHMEN = [
        {name: 'Doombot Legion', expansion: 'Core'},
        {name: 'Hand Ninjas', expansion: 'Core'},
        {name: 'Savage Land Mutates', expansion: 'Core'},
        {name: 'Sentinel', expansion: 'Core'},
    ]

    VILLAINS = [
        {name: 'Brotherhood', expansion: 'Core'},
        {name: 'HYDRA', expansion: 'Core'},
        {name: 'Masters Of Evil', expansion: 'Core'},
        {name: 'Radiation', expansion: 'Core'},
        {name: 'Enemies Of Asgard', expansion: 'Core'},
        {name: 'Skrulls', expansion: 'Core'},
        {name: 'Spider-Foes', expansion: 'Core'},
    ]

    SCHEMES = [
        {name: 'The Legacy Virus', expansion: 'Core'},
        {name: 'Midtown Bank Robbery', expansion: 'Core', bystandars: 12},
        {name: 'Negative Zone Prison Breakout', expansion: 'Core', henchmen: 1},
        {name: 'Portals To The Dark Dimension', expansion: 'Core'},
        {name: "Replace Earth's Leaders With Killbots", expansion: 'Core', bystanders: 18},
        {name: 'Secret Invasion Of The Skrull Shapeshifters', expansion: 'Core', heroes: 6, villains: "Skrulls"},
        {name: 'Super Hero Civil War', expansion: 'Core'},
        {name: 'Unleash The Power Of The Cosmic Cube', expansion: 'Core'},
    ]
end
