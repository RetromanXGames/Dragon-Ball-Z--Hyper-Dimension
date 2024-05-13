tournament_bracket_0000:
    gameText("┌    Combate ")
    db $F5, $05
    gameText("   (┐2)")
newline()
    gameText("└    ")
    db $F5, $03
    gameText("       VS")
    db $F5, $04
    gameText("         (┘1)")
endstring()

tournament_bracket_0001:
    db $00, $00, $C4, $40, $00, $00, $22, $03, $00, $00, $2E, $03, $28, $03, $00, $00, $00, $00, $22, $03, $C4, $00
endstring()
endstring()

tournament_bracket_0002:
    gameText("┌     Ultima Luta   ┐")
newline()
    gameText("└     ")
    db $F5, $04
    gameText("        VS            ┘")
endstring()

tournament_bracket_0003:
    db $00, $00, $00, $C4, $40, $00, $00, $22, $03, $00, $00, $2E, $03, $28, $03, $00, $00, $00, $00, $22, $03, $C4, $00 
endstring()
endstring()

tournament_bracket_0004:
    gameText("┌( +)  E o campeão( +) ┐")
newline()
    gameText("└( +)( +)( +)é...")
    db $F5, $04
    gameText("( +)( +)  ┘")
endstring()

tournament_bracket_0005:
    db $00, $00, $00, $00, $E6, $03, $E8, $03, $EA, $03, $EC, $03, $00, $00, $00, $00, $C4, $00
endstring()
endstring()
