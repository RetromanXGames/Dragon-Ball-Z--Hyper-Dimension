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
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx	


//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//-----------------------    VWF Table     ----------------------------------
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
    origin $039c7d
	include "asm\vwf_table.asm"
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx		





//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//-----------------------    Scripts     ------------------------------------
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx


//xxxxxxxxxxxxxxxxxxxxxxxx    Intro     xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//-----------------------   Script Bank   -----------------------------------
//--------------------   Banco dos Scripts   --------------------------------
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
    origin $00066AB7 // Endereço da Instrução que muda o Banco convertido de PC para SNES
    lda #$00AE
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//----------------   Pointers of Pointers Table   ---------------------------
//--------------   Ponteiro da Tabela de Ponteiros    -----------------------
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
	origin $00066AC4 // Endereço da Tabela convertido de PC para SNES
	lda $AE8000,x // Instrução que carrega o endereço
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx	


//xxxxxxxxxxxxxxxxxxxxxxxxx    History    xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//------------------  Pointers Table History Mode  --------------------------
//---------------  Tabela Ponteiros do Modo História  -----------------------
    origin $370000 
    include "asm\pointers_hystory_mode.asm"
    include "asm\pointers_vs_end_battle.asm"
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx	
//---------------------   Script History Mode   -----------------------------
//-------------------   Script do modo História   ---------------------------
	origin $371000
    include "spripts_ptbr\history.asm"
//---------------  Script End of Battle in Versus Mode  ---------------------
//-------------  Script do Fim da Batalho no Modo Versus   ------------------
    include "spripts_ptbr\vs_end_battle.asm"
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx


//xxxxxxxxxxxxxxxxxxx    Versus Mode Options     xxxxxxxxxxxxxxxxxxxxxxxxxxxx
//------------   Pointers Table of Versus Mode Options   --------------------
//---------   Tabela Ponteiros das Opções do Modo Versus   ------------------
    origin $0661ED 
    include "asm\pointers_menu_versus_mode.asm"
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//----------------   Script of Versus Mode Options   ------------------------
//---------------   Script das Opções do Modo Versus   ----------------------
	origin $030510//03007A	
	include "spripts_ptbr\menu_versus_mode.asm"
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
	include "spripts_ptbr\vs_mode_configuration.asm"	
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
	include "spripts_ptbr\menu_title_screen.asm"
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
	include "spripts_ptbr\option.asm"
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//------------------   Soundtrack Pointers Table   --------------------------
//---------------  Tabela Ponteiros da Trilha Sonora   ----------------------
	origin $010B8C 
    include "asm\pointers_soundtrack_menu.asm"
	origin $013e5e 
    include "asm\pointers_soundtrack_menu.asm"
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//---------------------   Script Soundtrack   -------------------------------
//------------------   Script da Trilha Sonora   ----------------------------
	origin $010BC0	
	include "spripts_ptbr\soundtrack_menu.asm"	
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
	include "spripts_ptbr\menu_tournament.asm"		
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
	include "spripts_ptbr\tournament_bracket.asm"		
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
	include "spripts_ptbr\continues.asm"		
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx


//xxxxxxxxxxxxxxxxxxxxxxxxx    Credits     xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//------------------  Table of Pointers of Credits  -------------------------
//---------------  Tabela dos Ponteiros dos Créditos  -----------------------
    //origin $03019A
    //include "asm\pointers_credits.asm"
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//----------------------   Script of Credits   ------------------------------
//---------------------   Script dos Créditos   -----------------------------
	origin $033E0E	
	include "spripts_ptbr\credits.asm"		
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx






//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx	
//----------------------    Graphics     ------------------------------------
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx


//xxxxxxxxxxxxxxxxxxxxxxxx    Names    xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//--------------------   Character Names    ---------------------------------	
//-----------------   Nomes dos Personagens    ------------------------------
    origin $E000
	insert "gfx_ptbr\names.bin"
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx	


//xxxxxxxxxxxxxxxxxxxxx   Combat Status   xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//---------------------   WIN/LOOSE/DRAW   ----------------------------------	
//----------------   Vitórias/Derrotas/Empates   ----------------------------
    origin $D800
	insert "gfx_ptbr\win_lose_draw.bin"
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx


//xxxxxxxxxxxxxxxxxxxxxxxxx    Font    xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//----------------------  Character Table    --------------------------------	
//-------------------   Tabela de Caracteres    -----------------------------
    origin $03877b
	insert "gfx_ptbr\character_table.bin"
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
	

//xxxxxxxxxxxxxxxxxxxxxxx    Options    xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//---------------------------  BGM    ---------------------------------------	
//----------------------  Trilha Sonora  ------------------------------------
    origin $CC40
	insert "gfx_ptbr\bgm.bin"
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//--------------------------  Effect  ---------------------------------------	
//--------------------------  Efeito  ---------------------------------------
    origin $C9E0
	insert "gfx_ptbr\effect.bin"
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//-------------------------  Blow Back  -------------------------------------	
//------------------------  Contragolpe  ------------------------------------
    origin $C760
	insert "gfx_ptbr\blow_back.bin"
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//-------------------------  Rush Battle  -----------------------------------	
//------------------------  Batalha Rápida  ---------------------------------
    origin $C4E0
	insert "gfx_ptbr\rush_battle.bin"
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//-------------------------  Stage Color  -----------------------------------	
//------------------------  Cor do Estágio  ---------------------------------
    origin $C240
	insert "gfx_ptbr\stage_color.bin"
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//-----------------------------  BGM  ---------------------------------------	
//-----------------------------  SOM  ---------------------------------------
    origin $C000
	insert "gfx_ptbr\som.bin"
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
	
	
//xxxxxxxxxxxxxxxxxxxxxxxxxx    Title    xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//----------------------------  Título  -------------------------------------
    origin $77000
	insert "gfx_ptbr\title.bin"
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
	

//xxxxxxxxxxxxxxxxxxxxxxxxxx    Names 2    xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//----------------------------  Nomes 2  ------------------------------------
    origin $6000
	insert "gfx_ptbr\names2.bin"
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
	





//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx	
//---------------------------   Detour     ----------------------------------
//---------------------------   Desvios     ---------------------------------
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx


//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx	
//--------------   Deviation from Hyper Dimension Chart     -----------------
//---------------   Desvio do Gráfico Hyper Dimension     -------------------
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
    origin $010134  // Endereço de Origem do Desvio Convertido do Endereço SNES
  	jml $A18000     // Desvio
	
	origin $302000  // <-- DMA SRC
hyperdiminension_grafico:
	insert "gfx_ptbr\hyper_dimension.bin"
hyperdiminension_grafico_end:

    origin $308000
	include "asm\hyper_dimension.asm"
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx	
//---------------   Deviation from Ready Ready Graph   ----------------------
//-------------------   Desvio do Gráfico Ready   ---------------------------
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
    origin $0700DE
  	jml    $A0B400
	
	origin $302A00
ready_grafico:
	insert "gfx_ptbr\ready.bin"
ready_grafico_end:

    origin $303400
	include "asm\ready.asm"
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//---------------   Tilemap Deviation from Ready Graph   --------------------
//---------------   Desvio do Tilemap do Gráfico Ready   --------------------
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//
//	  origin $01018A
//    jml    $A0E560
//    origin $306100
//endian msb
//tilemap_ready:
//insert "tilemap\ready.bin"
//tilemap_ready_end:
//endian lsb
// origin $306560
//include "asm\tilemap_ready.asm"
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx


//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx	
//---------------   Deviation from Game Over Graph   ------------------------
//-----------------   Desvio do Gráfico Game Over   -------------------------
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
    origin $016758
  	jml    $A0C800
	
	origin $304000
game_over_grafico:
	insert "gfx_ptbr\game_over.bin"
game_over_grafico_end:

    origin $304800
	include "asm\game_over.asm"
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//---------------   Tilemap Deviation from Game Over     --------------------
//----------------   Desvio do Tilemap do Game Over     ---------------------
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//
//	  origin $01018A
//    jml    $A0E560
//    origin $306100
//endian msb
//tilemap_ready:
//insert "tilemap\game_over.bin"
//tilemap_ready_end:
//endian lsb
// origin $306560
//include "asm\tilemap_game_over.asm"
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx


//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//--------   Deviation from the Martial Arts Tournament Graphic   -----------
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

