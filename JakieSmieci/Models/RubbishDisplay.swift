//
//  RubbishDisplay.swift
//  JakieSmieci
//
//  Created by Maciej Maj on 09/06/2020.
//  Copyright © 2020 Teal Fire. All rights reserved.
//

import Foundation
import SwiftUI

public class RubbishDisplay {
    
    
    static let rubbishTypeColors = [Color(red: 0.1, green: 0.1, blue: 0.1), Color(.systemGreen), Color(.brown), Color(.systemOrange), Color(.systemBlue), Color(.systemGray), Color(.systemGray), Color(.systemGreen), Color(.systemGray), Color(.systemGray)]
    
    static let description = [
        "Do pojemnika na odpady zmieszane wrzucaj tylko to, czego nie udało się rozdzielić do pojemników na odpady segregowane lub czego nie można oddać do PSZOK-u lub MPSZOK-u.",
        "",
        "Pamiętaj, że chodzi o bioodpady pochodzące z gospodarstw domowych.",
        "",
        "",
        "Zapytaj swojego administratora, gdzie znajdziesz miejsce przeznaczone do gromadzenia odpadów wielkogabarytowych.",
        "Zużyty sprzęt elektryczny oraz elektroniczny zanieść do punktu zbiórki zużytego elektrycznego i elektronicznego.",
        "Odbierane są od marca do listopada.",
        "Pozostałe odpady komunalne przeznaczone do unieszkodliwienia lub odzysku możesz oddać do Punktu Selektywnego Zbierania Odpadów Komunalnych."
    ]
    
    static let rulesDo = [
        "Resztki mięsne oraz kości, mokry lub zabrudzony papier, zużyte materiały higieniczne, w tym pieluchy jednorazowe, żwirek z kuwet dla zwierząt, fajans, potłuczone szyby i lustra, tekstylia",
        "Opakowania szklane, w szczególności: puste butelki, słoiki, opakowania po kosmetykach, puste opakowania po lekach",
        "Odpadki warzywne i owocowe, skorupki jaj, fusy po kawie i herbacie, zwiędłe kwiaty oraz rośliny doniczkowe, resztki jedzenia bez mięsa, kości oraz tłuszczów zwierzęcych",
        "Puste, zgniecione butelki plastikowe, zakrętki od butelek i słoików, plastikowe opakowania, torebki, worki foliowe, kartony po sokach i mleku (tzw. tetrapaki), zgniecione puszki po napojach i żywności",
        "Czyste opakowania z papieru i tektury, gazety, czasopisma i ulotki, kartony, zeszyty, papier biurowy",
        "Stare meble (także rozłożone na części) oraz wyroby tapicerskie (np. fotele, wersalki, pufy), materace, zabawki dużych rozmiarów",
        "",
        "Liście, skoszona trawa, rozdrobnione gałęzie",
        ""
    ]
    
    static let rulesDont = [
        "Sprzęt elektryczny oraz elektroniczny, AGD, baterie i akumulatory, odpady budowlane i remontowe, odpady zielone, leki oraz chemikalia",
        "Szkło stołowe, ceramika, wyroby ze szkła żaroodpornego, szkło okienne, lustra, szyby, żarówki, świetlówki, porcelana",
        "Resztki mięsne, kości oraz tłuszcze zwierzęce, olej jadalny, ziemia i kamienie, odchody zwierząt",
        "Zużyte baterie i akumulatory, sprzęt elektryczny oraz elektroniczny, puszki i pojemniki po farbach, butelki po olejach samochodowych, opakowania po aerozolach, opakowania po olejach silnikowych, zatłuszczony styropian po żywności",
        "Zatłuszczone opakowania z papieru, zużyte ręczniki papierowe i chusteczki",
        "Sprzęt elektryczny oraz elektroniczny (np.: stare pralki, lodówki), materiały i odpady budowlane, remontowe, wanny, umywalki, grzejniki, muszle toaletowe, ramy okienne, drzwi, niesprasowane, duże kartony, opony samochodowe",
        "",
        "Kamienie, popiół, ziemia",
        ""
    ]
    
    static func returnRubbishType(rubbish : RubbishItem) -> String {
       switch rubbish.Typ {
            case "Zmieszane":
                return "śmieci zmieszane"

            case "Szkło":
                return "szkło"

            case "Bio":
                return "śmieci biodegradowalne"
        
            case "Plastik i metal":
                return "plastik i metal"
        
            case "Papier":
                return "papier"
        
            case "Gabaryty":
                return "śmieci wielkogabarytowe"
        
            case "Elektrośmieci":
                return "elektrośmieci"
        
            case "Zielone":
                return "śmieci zielone"
        
            case "Inne":
                return "inne śmieci"

            default:
                return "none: " + rubbish.Typ
        }
    }
    
    static func returnRubbishId(rubbish : RubbishItem) -> Int {
       switch rubbish.Typ {
            case "Zmieszane":
                return 0

            case "Szkło":
                return 1

            case "Bio":
                return 2
        
            case "Plastik i metal":
                return 3
        
            case "Papier":
                return 4
        
            case "Gabaryty":
                return 5
        
            case "Elektrośmieci":
                return 6
        
            case "Zielone":
                return 7
        
            case "Inne":
                return 8

            default:
                return 8
        }
    }
    
    static func returnRubbishColor(rubbish : RubbishItem) -> Color {
        let id = returnRubbishId(rubbish: rubbish)
        return rubbishTypeColors[id]
    }
}

struct RubbishDisplay_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
