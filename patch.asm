//--------------------------------------------------------------------------//--------------------------------------------------------------------------//
//xxxxxxxxxxxxxxxx    Project Information in English    xxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxx    Informações Sobre o Projeto em Português    xxxxxxxxxxxxxxx//
//--------------------------------------------------------------------------//--------------------------------------------------------------------------//
//xxxxxxxxxxxxxxxxxxxxxxxxxxxx    Game    xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxxxx    Projeto    xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx//
//--------------------------------------------------------------------------//--------------------------------------------------------------------------//
//                      Game translation project:                           //                    Projeto de tradução do Jogo:                          //
//                   Dragon Ball Z - Hyper Dimension                        //                   Dragon Ball Z - Hyper Dimension                        //
//               of Super Nintendo for Brazilian Portuguese                 //              de Super Nintendo para o Português do Brasil                //
//--------------------------------------------------------------------------//--------------------------------------------------------------------------//
//xxxxxxxxxxxxxxxxxxxxxxxxxxx    Thanks    xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxx    Agradecimentos    xxxxxxxxxxxxxxxxxxxxxxxxxxxx//
//--------------------------------------------------------------------------//--------------------------------------------------------------------------//
//    I have to thank Anime_World a lot, he is a Brazilian romhacker and    //     Eu tenhos que agradecer muito ao Anime_World, ele é um romhacker     //
//       my Sensei, thanks man, for putting up with me all this time.       // Brasilieiro e meu Sensei, obrigado man, por me aguentar todo esse tempo. //
//              Without him I wouldn't have made it this far.               //               Sem ele eu não teria chegado tão longe.                    //
//                                                                          //                                                                          //
//      This project uses as a basis the English translation done by        //         Essa projeto usa como base a tradução feita para o inglês        //
//                  RedComet, DarknessSavior and Tom.                       //              feita pelo RedComet, DarknessSavior e o Tom.                //
//    I really wanted to thank them for their work, without them I would    //         Queria muito agradecer ao trabalho deles, sem eles eu não        //
//                     not be working in that game.                         //                     estaria trabalho nesse jogo.                         //
//--------------------------------------------------------------------------//--------------------------------------------------------------------------//
//xxxxxxxxxxxxxxxxxx    Distribution of Patch Asm    xxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxx    Distribuição do Patch Asm    xxxxxxxxxxxxxxxxxxxxxxx//
//--------------------------------------------------------------------------//--------------------------------------------------------------------------//
//    In order to also help anyone who wants to take this game to their	    //    Com o objetivo de ajudar também quem desejar levar esse jogo para     //
//          native language, I am making this PATCH ASM available.			//       sua linguagem nátiva, estou disponíbilizando esse PATCH ASM.		//
//       I tried to make it as practical as possible, I also followed       //    Procurei deixar ele o mais prático possível, também seguimentei		//
//          a lot to try to make it easier for anyone to edit.				//   muita coisa para tentar deixar ele mais fácil pra qualquer pessoa		//
//           This is still an ongoing project, so a lot still				//    editar. Esse ainda é um projeto em andamento, então muita coisa       //
//                 needs to be done and also improved.                      //              precisa ser feita ainda e também melhorada.                 //
//--------------------------------------------------------------------------//--------------------------------------------------------------------------//
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//----------------    SYSTEM ARCHITECTURE: Super Nintendo   -----------------	
//---------------   ARQUITETURA DO SISTEMA: Super Nintendo   ----------------
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
    arch snes.cpu
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx


//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//----------------------  ROM TYPE: little-endian   -------------------------
//--------------------  TIPO DA ROM: little-endian  -------------------------
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
    endian lsb
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx


//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx	
//-----------------------  Patched ROM: atched.smc   ------------------------
//--------------------  ROM Patcheada: patcheada.smc   ----------------------
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
    output "DBZ-HD(BR)VWFNEW.sfc",create
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx


//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx	
//---------------------------  Original ROM   -------------------------------
//---------------------------  ROM Original   -------------------------------
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
    origin $00000000
	insert "DBZ-HD(JAPAN)VWF.sfc"
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx	


//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx	
//----------------------------  Constants  ----------------------------------
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
    include "asm\Constantes.asm"
	include "asm\macro.asm"
    include "lib\snes.asm"                        
    include "lib\snes_gfx.asm"                                
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx	


//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//-----------------------    VWF Table     ----------------------------------
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
    origin $039c7d
	include "asm\vwf_table.asm"
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx		



//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx	
//--------------  Splash Vila Oculta do Romhacking  -------------------------
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
	origin $007F13 // Rotina Original 
	jml    $A2D000 //da Rotina
	origin $315000
	include "splash\splash.asm"
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx	



//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//-----------------------    Scripts     ------------------------------------
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx


//xxxxxxxxxxxxxxxxxxxxxxxx    Intro     xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//-----------------------   Script Bank   -----------------------------------
//--------------------   Banco dos Scripts   --------------------------------
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
    origin $00066AB7 // Endereço da Instrução que muda o Banco convertido de PC para SNES
    lda #$00A2
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//----------------   Pointers of Pointers Table   ---------------------------
//--------------   Ponteiro da Tabela de Ponteiros    -----------------------
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
	origin $00066AC4 // Endereço da Tabela convertido de PC para SNES
	lda $A28000,x // Instrução que carrega o endereço
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx	


//xxxxxxxxxxxxxxxxxxxxxxxxx    History    xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//------------------  Pointers Table History Mode  --------------------------
//---------------  Tabela Ponteiros do Modo História  -----------------------
    origin $310000 
    include "asm\pointers_hystory_mode.asm"
    include "asm\pointers_vs_end_battle.asm"
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx	
//---------------------   Script History Mode   -----------------------------
//-------------------   Script do modo História   ---------------------------
	origin $310200
    include "scripts_ptbr\history.asm"
//---------------  Script End of Battle in Versus Mode  ---------------------
//-------------  Script do Fim da Batalho no Modo Versus   ------------------
    include "scripts_ptbr\vs_end_battle.asm"
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx


//xxxxxxxxxxxxxxxxxxx    Versus Mode Options     xxxxxxxxxxxxxxxxxxxxxxxxxxxx
//------------   Pointers Table of Versus Mode Options   --------------------
//---------   Tabela Ponteiros das Opções do Modo Versus   ------------------
    origin $0661ED 
    include "asm\pointers_menu_versus_mode.asm"
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//----------------   Script of Versus Mode Options   ------------------------
//---------------   Script das Opções do Modo Versus   ----------------------
	origin $030520//03007A	
	include "scripts_ptbr\menu_versus_mode.asm"
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx


//xxxxxxxxxxxxxxxxx    Versus Mode Configuration     xxxxxxxxxxxxxxxxxxxxxxxx
//---------   Table of Versus Mode Configuration Pointers   -----------------
//------   Tabela de Ponteiros da Configuração do Modo Versus   -------------
    origin $0661EF 
    include "asm\pointers_vs_mode_configuration.asm"
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//--------------   Script of Versus Mode Configuration   --------------------
//-------------   Script da Configuração do Modo Versus   -------------------
	origin $030570//0300AA	
	include "scripts_ptbr\vs_mode_configuration.asm"	
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx


//xxxxxxxxxxxxxxxxxxx    Menu Title Screen     xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//-------------   Title Screen Menu Pointers Table   ------------------------
//-----------  Tabela Ponteiros do Menu da Tela Título   --------------------
    origin $0661EB 
    include "asm\pointers_menu_title_screen.asm"
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//-----------------   Script Menu Title Screen   ----------------------------
//---------------   Script do Menu da Tela Título   -------------------------
	origin $030480//030000	
	include "scripts_ptbr\menu_title_screen.asm"
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx


//xxxxxxxxxxxxxxxxxxxxxxxx    Options     xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//----------------   Options Mode Pointers Table   --------------------------
//---------------  Tabela Ponteiros do Modo Opções   ------------------------
    origin $010B7A
    include "asm\pointers_option.asm"
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//--------------------   Script Options Mode   ------------------------------
//-------------------   Script do Modo Opções   -----------------------------
	origin $010B1E	
	include "scripts_ptbr\option.asm"
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx


//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//------------------   Soundtrack Pointers Table   --------------------------
//---------------  Tabela Ponteiros da Trilha Sonora   ----------------------
	origin $010B8C 
    include "asm\pointers_soundtrack_menu.asm"
	origin $013E60 
    include "asm\pointers_soundtrack_menu_vs.asm"
	
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//---------------------   Script Soundtrack   -------------------------------
//------------------   Script da Trilha Sonora   ----------------------------
	origin $010BB8  //307000   ////$3746C0------Eendereço Original
	include "scripts_ptbr\soundtrack_menu.asm"	
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx


//xxxxxxxxxxxxxxxxxxx    Tournament Mode Menu     xxxxxxxxxxxxxxxxxxxxxxxxxxx
//---------------  Tournament Mode Menu Pointers Table  ---------------------
//----------  Tabela dos Ponteiros do Menu do Modo Torneio  -----------------
    origin $0661F1
    include "asm\pointers_menu_tournament.asm"
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//-------------------   Script of Tournament Mode   -------------------------
//-----------------   Script do Menu do Modo Torneio   ----------------------
	origin $030660	
	include "scripts_ptbr\menu_tournament.asm"		
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx


//xxxxxxxxxxxxxxxxxxx    Tournament Bracket     xxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//-----------  Table of Pointers of Tournament bracket  ---------------------
//----------  Tabela dos Ponteiros das Chaves do Torneio  -------------------
    origin $0661F3
    include "asm\pointers_tournament_bracket.asm"
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//---------------   Script of Tournament bracket   --------------------------
//---------------   Script das Chaves do Torneio   --------------------------
	origin $0306C0	
	include "scripts_ptbr\tournament_bracket.asm"		
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx


//xxxxxxxxxxxxxxxxxxxxxxxxx    Continues     xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//-----------------  Table of Pointers of Continues  ------------------------
//---------------  Tabela dos Ponteiros dos Continues  ----------------------
    origin $0661F9
    include "asm\pointers_continues.asm"
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//---------------------   Script of Continues   -----------------------------
//---------------------   Script dos Continues   ----------------------------
	origin $030780	
	include "scripts_ptbr\continues.asm"		
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx


//xxxxxxxxxxxxxxxxxxxxxxxxx    Credits     xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//------------------  Table of Pointers of Credits  -------------------------
//---------------  Tabela dos Ponteiros dos Créditos  -----------------------
    origin $033DC4
    include "asm\pointers_credits.asm"

	origin $066197
	lda #$00A0
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//----------------------   Script of Credits   ------------------------------
//---------------------   Script dos Créditos   -----------------------------
	origin $304600//$033E06	
	include "scripts_ptbr\credits.asm"		
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx






//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx	
//----------------------    Graphics     ------------------------------------
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx


//xxxxxxxxxxxxxxxxxxxxxxxx    Names    xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//--------------------   Character Names    ---------------------------------	
//-----------------   Nomes dos Personagens    ------------------------------
    origin $00E000
	insert "gfx_ptbr\names.bin"
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx


//xxxxxxxxxxxxxxxxxxxxx   Combat Status   xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//---------------------   WIN/LOOSE/DRAW   ----------------------------------	
//----------------   Vitórias/Derrotas/Empates   ----------------------------
    origin $00D800
	insert "gfx_ptbr\win_lose_draw.bin"
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx


//xxxxxxxxxxxxxxxxxxxxxxxxx    Font    xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//----------------------  Character Table    --------------------------------	
//-------------------   Tabela de Caracteres    -----------------------------
    origin $03877b
	insert "gfx_ptbr\character_table.bin"
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx


//xxxxxxxxxxxxxxxxxxxxxxxxx    Font    xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//----------------------  New Character Table  ------------------------------	
//-------------------   Tabela de Caracteres    -----------------------------
    origin $30877b
	insert "gfx_ptbr\character_table_new.bin"


	origin $066ADF
	db $A1
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx


//xxxxxxxxxxxxxxxxxxxxxxx    Options    xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//---------------------------  BGM    ---------------------------------------	
//----------------------  Trilha Sonora  ------------------------------------
    origin $00CC40
	insert "gfx_ptbr\bgm.bin"
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//--------------------------  Effect  ---------------------------------------	
//--------------------------  Efeito  ---------------------------------------
    origin $0C9E0
	insert "gfx_ptbr\effect.bin"
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//-------------------------  Blow Back  -------------------------------------	
//------------------------  Contragolpe  ------------------------------------
    origin $00C760
	insert "gfx_ptbr\blow_back.bin"
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//-------------------------  Rush Battle  -----------------------------------	
//------------------------  Batalha Rápida  ---------------------------------
    origin $00C4E0
	insert "gfx_ptbr\rush_battle.bin"
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//-------------------------  Stage Color  -----------------------------------	
//------------------------  Cor do Estágio  ---------------------------------
    origin $00C240
	insert "gfx_ptbr\stage_color.bin"
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//-----------------------------  BGM  ---------------------------------------	
//-----------------------------  SOM  ---------------------------------------
    origin $00C000
	insert "gfx_ptbr\som.bin"
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
	
	
//xxxxxxxxxxxxxxxxxxxxxxxxxx    Title    xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//----------------------------  Título  -------------------------------------
    origin $077000
	insert "gfx_ptbr\title.bin"
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
	

//xxxxxxxxxxxxxxxxxxxxxxxxxx    Names 2    xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//----------------------------  Nomes 2  ------------------------------------
    origin $006000
	insert "gfx_ptbr\names2.bin"
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx


//xxxxxxxxxxxxxxxxxxxxxxxx   READY/FIGHT!   xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//-----------------------   PRONTOS/LUTEM!   --------------------------------
	origin $2ABCA9
	insert "gfx_ptbr\ready.bin"
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
	

//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx	
//---------------------------   Branchs   -----------------------------------
//---------------------------   Desvios   -----------------------------------
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx


//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx	
//----------------   Branch from Hyper Dimension Chart     ------------------
//----------------   Desvio do Gráfico Hyper Dimension     ------------------
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
    origin $010134  
  	jml    $A18000 
	
	origin $302000 
hyperdiminension_grafico:
	insert "gfx_ptbr\hyper_dimension.bin"
hyperdiminension_grafico_end:

    origin $308000
	include "asm\hyper_dimension.asm"
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx


//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx	
//------   Branch from P1 and P2 on Player Select Screen of VS Mode   -------
//--   Desvio do Gráfico P1 e P2 na de Seleção de Personagem no modo VS   ---
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
    origin $011F53  
  	jml    $A1CE00 
	
	origin $30CA00
p1_p2_grafico:
	insert "gfx_ptbr\p1_p2.bin"
p1_p2_grafico_end:

    origin $30CE00
	include "asm\p1_p2.asm"



//------------------------------------
	origin $014253
	jml $A0E000

	origin $306000
	jsl $00A21C
	rep #$20
	pha 
	lda $3006
	cmp #$3609
	bne continua_p1_p8
	brl retorna_p1_p8_original
continua_p1_p8:
	sep #$20
	phx 
	phy
	LoadVRAM($A0D000, $B3D8, $04, 0)
	LoadVRAM($A0D004, $B418, $04, 0)
	LoadVRAM($A0D008, $B3E4, $04, 0)
	LoadVRAM($A0D00C, $B424, $04, 0)
	ply 
	plx 
retorna_p1_p8_original:
	rep #$20
	pla
	jml $02C259


	origin $305000
	db $05, $21, $04, $21
	db $07, $21, $06, $21
	db $0D, $21, $0C, $21
	db $0F, $21, $0E, $21

//----------MUDAR POSIÇÃO DO CPU/P1/P2 no Menu de Versus

	origin $012450
	jml $A0E400

	origin $306400
  	jsl $02B61D

	rep #$20
	pha
  	sep #$20

	lda #$94 
	sta $7E70CA
	inc 
	sta $7E70C8
	inc 
	sta $7E710A
	inc 
	sta $7E7108

	lda #$98 
	sta $7E70F2
	inc 
	sta $7E70F0
	inc 
	sta $7E7132
	inc 
	sta $7E7130
	inc 
	sta $7E70F4
	inc 
	sta $7E7134
	lda #$11
	sta $7E70F1
	sta $7E70F3
	sta $7E7131
	sta $7E7133
	sta $7E70CB
	sta $7E710B
	sta $7E70C9
	sta $7E7109
	rep #$20

	lda #$1000
	sta $7E70F6
	sta $7E70F8
	sta $7E7136
	sta $7E7138
	sta $7E70CC
	sta $7E710C
	pla 
  	ldx #$0400
	sep #$20
	jml $02A454



	origin $13524
	jml $A0EB00

	origin $306B00
  	jsl $0CE55A
	pha 
	phx 
	phy
	sep #$20
	LoadVRAM($A0EA00, $7980, $60, 0)
	rep #$20
	plx 
	ply
	pla
	jml $02B528

	origin $306A00
	insert "gfx_ptbr\cpu.bin"

//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx


//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx	
//---------------------   Branch from P1 and P8     -------------------------
//---------------   Desvio do Gráfico Hyper Dimension     -------------------
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
    origin $013F9A  
  	jml    $A09000 

    origin $301000
	include "asm\p1_p8.asm"

	origin $0141C7  
  	jml    $A09200 

    origin $301200
	include "asm\p1_p8_2.asm"	

//-------[P1]
    origin $013B37
//-----[X]--[Y]-[Tile][OPTS]   [#]
    db $F8, $0C, $64, $00
    db $00, $0C, $50, $00
    db $0B, $ED, $66, $C0
    db $0B, $0B, $66, $40
    db $ED, $ED, $66, $80
    db $ED, $0B, $66, $00
    db $80


//-------[P2]
    origin $013C4A
//-----[X]--[Y]-[Tile][OPTS]   [#]
    db $F8, $0B, $65, $00
    db $00, $0B, $51, $00
    db $ED, $0B, $67, $40
    db $0B, $0B, $67, $00
    db $0B, $ED, $67, $80
    db $ED, $ED, $67, $C0
    db $80	
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx


//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//---   Adjusting Sprite Properties from Players on Tournament Bracket   ----
//---   Propriedades dos Sprites dos Jogadores nas Chasves do Torneio   -----
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
	origin $0156A6
//-------[X]   [#]
	dw $0018   //- P1
	dw $0058   //- P2
	dw $0098   //- P3
	dw $00D8   //- P4
	dw $0018   //- P5
	dw $0058   //- P6
	dw $0098   //- P7
	dw $00D8   //- P8
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//-------[Y]   [#]
	dw $002F   //- P1
	dw $002F   //- P2
	dw $002F   //- P3
	dw $002F   //- P4
	dw $00CF   //- P5
	dw $00CF   //- P6
	dw $00CF   //- P7
	dw $00CF   //- P8
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
// [OPTS][Tile][Y][X]   [#]
	dd $00500008     //-1   
	dd $00640000     //-P
	origin $0156CF   
	dd $00510008     //-2   
	dd $00650000     //-P
	origin $0156D8   
	dd $00520008     //-3   
	dd $00640000     //-P
	origin $0156E1   
	dd $00530008     //-4   
	dd $00650000     //-P
	origin $0156EA   
	dd $00540008     //-5   
	dd $00640000     //-P
	origin $0156F3   
	dd $00550008     //-6   
	dd $00650000     //-P
	origin $0156FC   
	dd $00560008     //-7   
	dd $00640000     //-P
	origin $015705   
	dd $00570008     //-8   
	dd $00650000     //-P
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx


//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//-----   Adjusting Sprite Properties of Tournament Player Select   ---------
//---   Propriedades dos Sprites na Seleção de Personagem do Torneio   ------
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
// [OPTS][Tile][Y][X]   [#]
	origin $013B37
	dd $00640CF8        // - P   
	dd $00500C00        // - 1
	origin $013B50
	dd $00650CF8        // - P
	origin $013B64
	dd $00510C00        // - 2
	origin $013B69
	dd $00640CF8        // - P
	dd $00520C00        // - 3
	origin $013B82
	dd $00650CF8        // - P
	dd $00530C00        // - 4
	origin $013B9B
	dd $00640CF8        // - P
	dd $00540C00        // - 5
	origin $013BB4
	dd $00650CF8        // - P
	dd $00550C00        // - 6
	origin $013BCD
	dd $00640CF8        // - P
	dd $00560C00        // - 7
	origin $013BE6
	dd $00650CF8        // - P
	dd $00570C00        // - 8
	origin $013BFF
	dd $00610C00        // - CPU1-BLUE
	dd $00600CF8        // - CPU2-BLUE
	origin $013C18
	dd $00630C00        // - CPU1-YELLOW
	dd $00620CF8        // - CPU2-YELLOW
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx 


//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx	
//----------------------   Ready and Fight!   -------------------------------
//-----------------------  Prontos e Lutem!   -------------------------------
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx	
//---------------   Branch from Ready and Fight! Graph   --------------------
//--------------   Desvio dos Gráficos Prontos e Lutem!   -------------------
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
    origin $0700DE
  	jml    $A0B400
	
	origin $302A00
ready_grafico:
	insert "gfx_ptbr\ready_fight.bin"
ready_grafico_end:

    origin $303400
	include "asm\ready.asm"
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//-----------------------   READY Pointer   ---------------------------------
//--------------------   Ponteiro do PRONTOS   ------------------------------
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
	origin $04BBA9
	dl $A09400
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//------------   Adjusting Sprite Properties of READY   ---------------------
//-------   Ajuste das Propriedades dos Sprites do PRONTOS   ----------------
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
	origin $301400
// [OPTS][Tile][Y][X]   [#]
	dd $103900D0     //-#00 Sprite 16X16 - P ---(BAIXO/LOW)
	dd $103B00E0     //-#02 Sprite 16X16 - RO --(BAIXO/LOW) 
	dd $003D00F0     //-#03 Sprite  8x8  - O ---(BAIXO/LOW) 
	dd $003E00F8     //-#05 Sprite  8x8  - N ---(BAIXO/LOW) 
	dd $003F0000     //-#06 Sprite  8x8  - NT --(BAIXO/LOW) 
	dd $00590008     //-#07 Sprite  8x8  - T ---(BAIXO/LOW) 
	dd $005A0010     //-#08 Sprite  8x8  - O ---(BAIXO/LOW) 
	dd $005B0018     //-#09 Sprite  8x8  - O ---(BAIXO/LOW) 
	dd $105C0020     //-#10 Sprite 16X16 - P ---(ALTO/HIGH)
	dd $1060F0D0     //-#17 Sprite 16X16 - P ---(ALTO/HIGH)
	dd $1062F0E0     //-#16 Sprite 16X16 - RO --(ALTO/HIGH)
	dd $1064F0F0     //-#15 Sprite 16X16 - ON --(ALTO/HIGH)
	dd $1066F000     //-#14 Sprite 16X16 - T ---(ALTO/HIGH)
	dd $1068F010     //-#13 Sprite 16X16 - O ---(ALTO/HIGH)
	dd $106AF020     //-#12 Sprite 16X16 - S ---(ALTO/HIGH)
//-----------------------END-----------------------------
	dd $49001880
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//-----------------------  FIGHT! Pointer   ---------------------------------
//--------------------   Ponteiro do FIGHT!  --------------------------------
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
	origin $04BBAC
	dl $A09500  
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//---------------   Adjusting Sprite Properties of FIGHT   ------------------
//-----------   Ajuste das Propriedades dos Sprites do LUTEM!   -------------
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
	origin $301500
// [OPTS][Tile][Y][X]   [#]
	dd $005000E0     //-#00 Sprite  8x8  - L ---(BAIXO/LOW)
	dd $005100E8     //-#01 Sprite  8x8  - LU --(BAIXO/LOW)
	dd $005200F0     //-#02 Sprite  8x8  - U ---(BAIXO/LOW)
	dd $005300F8     //-#03 Sprite  8x8  - T ---(BAIXO/LOW)
	dd $00540000     //-#04 Sprite  8x8  - TE --(BAIXO/LOW)
	dd $00550008     //-#05 Sprite  8x8  - EM --(BAIXO/LOW)
	dd $00560010     //-#06 Sprite  8x8  - M ---(BAIXO/LOW)
	dd $00570018     //-#07 Sprite  8x8  - M ---(BAIXO/LOW)
	dd $00580020     //-#08 Sprite  8x8  - ! ---(BAIXO/LOW)
	dd $0048F820     //-#09 Sprite  8x8  - ! ---(BAIXO/LOW)
	dd $0038F020     //-#10 Sprite  8x8  - ! ---(BAIXO/LOW)
	dd $1030F0E0     //-#11 Sprite 16X16 - LU --(ALTO/HIGH)
	dd $1032F0F0     //-#12 Sprite 16X16 - UT --(ALTO/HIGH)
	dd $1034F000     //-#13 Sprite 16X16 - E ---(ALTO/HIGH)
	dd $1036F010     //-#14 Sprite 16X16 - M ---(ALTO/HIGH)
//-----------------------END-----------------------------
	dd $73081480
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx


//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx	
//----------------------------   K.O.   -------------------------------------
//--------------------------   Nocaute   ------------------------------------
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//------------------------   K.O. Pointer   ---------------------------------
//------------------   Configuração do Nocaute   ----------------------------
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
	origin $04BBB2
	dl $A09600
	origin $04BBB5
	dl $A09600
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//-------------   Adjusting Sprite Properties of K.O.   ---------------------
//--------   Ajuste das Propriedades dos Sprites do NOCAUTE   ---------------
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
	origin $301600
// [OPTS][Tile][Y][X]   [#]
	dd $1030F8D4 // #00 Sprite 16x16 - N ---(ALTO/HIGH)
	dd $1032F8E4 // #01 Sprite 16x16 - O ---(ALTO/HIGH)
	dd $1034F8F4 // #02 Sprite 16x16 - A ---(ALTO/HIGH)
	dd $1036F804 // #03 Sprite 16x16 - U ---(ALTO/HIGH)
	dd $1038F814 // #04 Sprite 16x16 - T ---(ALTO/HIGH)
	dd $003AF824 // #05 Sprite  8x8  - E ---(ALTO/HIGH)
	dd $004A0024 // #06 Sprite  8x8  - E ---(ALTO/HIGH)
	dd $005A0824 // #07 Sprite  8x8  - E ---(ALTO/HIGH)
	dd $005008D4 // #08 Sprite  8x8  - N ---(BAIXO/LOW) 
    dd $005108DC // #09 Sprite  8x8  - N ---(BAIXO/LOW)
	dd $005208E4 // #10 Sprite  8x8  - O ---(BAIXO/LOW) 
	dd $005308EC // #11 Sprite  8x8  - OC --(BAIXO/LOW)
	dd $005408F4 // #12 Sprite  8x8  - C ---(BAIXO/LOW)
	dd $005508FC // #13 Sprite  8x8  - A ---(BAIXO/LOW)
	dd $00560804 // #14 Sprite  8x8  - AU --(BAIXO/LOW) 
    dd $0057080C // #15 Sprite  8x8  - U ---(BAIXO/LOW)
	dd $00580814 // #16 Sprite  8x8  - T ---(BAIXO/LOW) 
	dd $0059081C // #17 Sprite  8x8  - TE --(BAIXO/LOW)
//-----------------------END-----------------------------
	dd $7CF40C80 
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx


//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx	
//------------------   Double K.O. Graph   ----------------------------------
//-------------------   Nocaute Duplo   -------------------------------------
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//------------------  Double K.O. Pointer   ---------------------------------
//--------------   Ponteiro do Nocaute Duplo  -------------------------------
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
	origin $04BBAF
	dl $A09700
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//--------   Adjusting Sprite Properties of Double K.O.   -------------------
//---   Ajuste das Propriedades dos Sprites do NOCAUTE DUPLO   --------------
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
	origin $301700
//-----------------------K.O.----------------------------
//---------------------NOCAUTE---------------------------
// [OPTS][Tile][Y][X]   [#]
	dd $1030F8D4 // #00 Sprite 16x16 - N ---(ALTO/HIGH)
	dd $1032F8E4 // #01 Sprite 16x16 - O ---(ALTO/HIGH)
	dd $1034F8F4 // #02 Sprite 16x16 - A ---(ALTO/HIGH)
	dd $1036F804 // #03 Sprite 16x16 - U ---(ALTO/HIGH)
	dd $1038F814 // #04 Sprite 16x16 - T ---(ALTO/HIGH)
	dd $003AF824 // #05 Sprite  8x8  - E ---(ALTO/HIGH)
	dd $004A0024 // #06 Sprite  8x8  - E ---(ALTO/HIGH)
	dd $005A0824 // #07 Sprite  8x8  - E ---(ALTO/HIGH)
	dd $005008D4 // #08 Sprite  8x8  - N ---(BAIXO/LOW) 
    dd $005108DC // #09 Sprite  8x8  - N ---(BAIXO/LOW)
	dd $005208E4 // #10 Sprite  8x8  - O ---(BAIXO/LOW) 
	dd $005308EC // #11 Sprite  8x8  - OC --(BAIXO/LOW)
	dd $005408F4 // #12 Sprite  8x8  - C ---(BAIXO/LOW)
	dd $005508FC // #13 Sprite  8x8  - A ---(BAIXO/LOW)
	dd $00560804 // #14 Sprite  8x8  - AU --(BAIXO/LOW) 
    dd $0057080C // #15 Sprite  8x8  - U ---(BAIXO/LOW)
	dd $00580814 // #16 Sprite  8x8  - T ---(BAIXO/LOW) 
	dd $0059081C // #17 Sprite  8x8  - TE --(BAIXO/LOW)
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx	
//----------------------DOUBLE---------------------------
//----------------------DUPLO----------------------------
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
	dd $106010D8 // #18 Sprite 16x16 - D -----(ALTO/HIGH)
	dd $106210E8 // #19 Sprite 16x16 - U -----(ALTO/HIGH)
	dd $106410F8 // #20 Sprite 16x16 - PL ----(ALTO/HIGH)
	dd $10661008 // #21 Sprite 16x16 - LO ----(ALTO/HIGH)
	dd $10681018 // #22 Sprite 16x16 - O -----(ALTO/HIGH)
	dd $006A1028 // #23 Sprite 16x16 - BLANK -(ALTO/HIGH)
	dd $007A1828 // #24 Sprite 16x16 - O -----(ALTO/HIGH)
	dd $103B20D8 // #25 Sprite 16x16 - D -----(BAIXO/LOW)
	dd $103D20E8 // #26 Sprite 16x16 - U -----(BAIXO/LOW)
	dd $003F20F8 // #27 Sprite  8x8  - P -----(BAIXO/LOW)
	dd $004F28F8 // #28 Sprite  8x8  - P -----(BAIXO/LOW)
	dd $105B2000 // #29 Sprite 16x16 - PL ----(BAIXO/LOW)
	dd $105D2010 // #30 Sprite 16x16 - O -----(BAIXO/LOW)
	dd $005F2020 // #31 Sprite  8x8  - O -----(BAIXO/LOW)
	dd $006F2820 // #32 Sprite  8x8  - O -----(BAIXO/LOW)
	dd $007B2028 // #33 Sprite  8x8  - O -----(BAIXO/LOW)
	dd $007C2828 // #34 Sprite  8x8  - BLANK -(BAIXO/LOW)
//-----------------------END-----------------------------
	dd $30F8D480
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx


//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx	
//-----------------   Branch from Game Over Graph   -------------------------
//-----------------   Desvio do Gráfico Game Over   -------------------------
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
    origin $01674E
  	jml    $A08000
	
	origin $300600
game_over_grafico:
	insert "gfx_ptbr\game_over.bin"
game_over_grafico_end:

    origin $300000
	include "asm\game_over.asm"
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx


//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//--------   Adjusting Sprite Properties of GAME OVER   ---------------------
//---   Ajuste das Propriedades dos Sprites do FIM DE JOGO   ----------------
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
	origin $035AA1
// [OPTS][Tile][Y][X]   [#]
    dd $0029000E    //-#00 Sprite  8x8  - J
	dd $0020F80E    //-#00 Sprite  8x8  - J
	dd $002A0019    //-#00 Sprite  8x8  - O1  
	dd $0021F819    //-#00 Sprite  8x8  - O1 
	dd $003C0019    //-#00 Sprite  8x8  - O1  
	dd $0033F819    //-#00 Sprite  8x8  - O1  
	dd $003B000E    //-#00 Sprite  8x8  - J
	dd $0032F80E    //-#00 Sprite  8x8  - J
	dd $002800FD    //-#00 Sprite  8x8  - E 
	dd $001FF8FD    //-#00 Sprite  8x8  - E   
	dd $003A00FD    //-#00 Sprite  8x8  - E  
	dd $0031F8FD    //-#00 Sprite  8x8  - E   
	dd $003600CB    //-#00 Sprite  8x8  - F   
	dd $002DF8CB    //-#00 Sprite  8x8  - F  
	dd $003700D6    //-#00 Sprite  8x8  - I 
	dd $002EF8D6    //-#00 Sprite  8x8  - I   
	dd $003900F2    //-#00 Sprite  8x8  - D
	dd $003800DD    //-#00 Sprite  8x8  - M
	dd $0030F8F2    //-#00 Sprite  8x8  - D
	dd $002FF8DD    //-#00 Sprite  8x8  - M
	dd $003D0024    //-#00 Sprite  8x8  - G  
	dd $0034F824    //-#00 Sprite  8x8  - G  
	dd $003E002F    //-#00 Sprite  8x8  - O2 
	dd $0035F82F    //-#00 Sprite  8x8  - O2 
	dd $002C002F    //-#00 Sprite  8x8  - O2
	dd $0023F82F    //-#00 Sprite  8x8  - O2 
	dd $002B0024    //-#00 Sprite  8x8  - G  
	dd $0022F824    //-#00 Sprite  8x8  - G  
	dd $002700F2    //-#00 Sprite  8x8  - D  
	dd $002600DD    //-#00 Sprite  8x8  - M  
	dd $001EF8F2    //-#00 Sprite  8x8  - D  
	dd $001DF8DD    //-#00 Sprite  8x8  - M  
	dd $002500D6    //-#00 Sprite  8x8  - I  
	dd $001CF8D6    //-#00 Sprite  8x8  - I  
	dd $002400CB    //-#00 Sprite  8x8  - F  
	dd $001BF8CB    //-#00 Sprite  8x8  - F  
	dd $001A002F    //-#00 Sprite  8x8  - O2  
	dd $00190024    //-#00 Sprite  8x8  - G  
	dd $00180019    //-#00 Sprite  8x8  - O1  
	dd $0017000E    //-#00 Sprite  8x8  - J
	dd $0011F82F    //-#00 Sprite  8x8  - O2  
	dd $0010F824    //-#00 Sprite  8x8  - G  
	dd $000FF819    //-#00 Sprite  8x8  - O1  
	dd $000EF80E    //-#00 Sprite  8x8  - J
	dd $001600FD    //-#00 Sprite  8x8  - E  
	dd $001500F2    //-#00 Sprite  8x8  - D  
	dd $001400DD    //-#00 Sprite  8x8  - M  
	dd $001300D6    //-#00 Sprite  8x8  - I  
	dd $001200CB    //-#00 Sprite  8x8  - F  
	dd $000DF8FD    //-#00 Sprite  8x8  - E  
	dd $000CF8F2    //-#00 Sprite  8x8  - D  
	dd $000BF8DD    //-#00 Sprite  8x8  - M  
	dd $000AF8D6    //-#00 Sprite  8x8  - I  
	dd $0009F8CB    //-#00 Sprite  8x8  - F
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx


//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//---------   Branch from the Martial Arts Tournament Graphic   -------------
//-----------   Desvio do Gráfico Torneio de Artes Marciais   ---------------
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
    origin $070443
    jml    $A0BC00
	
	origin $303600
torneio_grafico:
	insert "gfx_ptbr\martial_arts_tournament.bin"
torneio_grafico_end:

    origin $303C00
	include "asm\martial_arts_tournament.asm"
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx



//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx	
//--------------   Extra Characters from End Battle   -----------------------
//-------------  Carácteres Extras dos Fins de Batalha   --------------------
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx	
//----------   Branch from Extra Characters from End Battle   ---------------
//--------   Desvio dos Carácteres Extras dos Fins de Batalha   -------------
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
    origin $06688E
  	jml    $A0BE00
	
	origin $304000
end_battle_grafico:
	insert "gfx_ptbr\end_battle.bin"
end_battle_grafico_end:

    origin $303E00
	include "asm\end_battle.asm"
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx	
//---------   Branch Tilemap of Extra Characters from End Battle  -----------
//---------   Tilemap dos Carácteres Extras dos Fins de Batalha   -----------
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//    origin $0127AE
//  	jml    $A0BE00
//	
//	origin $304400
//end_battle_grafico:
//	insert "gfx_ptbr\end_battle_tilemap.bin"
//end_battle_grafico_end:
//
//    origin $304200
//	include "asm\end_battle_tilemap.asm"
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx


//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx	
//xxxxxxxxxxxxxxxxxxxxxxxxx   CUTSCENES   xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//    origin $016340
//  	jml    $A1EC00
//	
//	origin $30D000
//
//	insert dbzhd_freeza_001_kuririn_dead, "cutscenes\dbzhd_freeza_001_kuririn_dead.bin"
//
//origin $30E200
//dbzhd_freeza_001_kuririn_dead_palette:
//	insert "cutscenes\dbzhd_freeza_001_kuririn_dead_palette.bin"
//dbzhd_freeza_001_kuririn_dead_palette_end:
//
//origin $30E400
//dbzhd_freeza_001_kuririn_dead_tilemap:
//	insert "cutscenes\dbzhd_freeza_001_kuririn_dead_3.bin"
//dbzhd_freeza_001_kuririn_dead_tilemap_end:
//
//    origin $30EC00
//	include "asm\cutscenes_freeza_001_kuririn_dead.asm"
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
