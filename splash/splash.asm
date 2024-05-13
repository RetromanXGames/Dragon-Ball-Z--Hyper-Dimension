//=============================
// WaitNMI - Wait For NMI Flag
//=============================
macro time_splash() {
  tempo_exibicao:
  FadeIN()           
  rep #$20
  lda.w #$ffff
compara_tempo_exibicao:  
  cmp #$0000
  beq tempo_exibicao_001
  dec
  WaitHV()
  bra compara_tempo_exibicao
tempo_exibicao_001:
  lda.w #$7FFF
compara_tempo_exibicao_001: 
  cmp #$0000
  beq sair_splash
  dec
  WaitHV()
  bra compara_tempo_exibicao_001                                
sair_splash:
  sep #$20
  FadeOUT()
  WaitNMI()  
}

//=============================
// WaitNMI - Wait For NMI Flag
//=============================
macro time_splash_2() {
  tempo_exibicao_2:
  FadeIN()           
  rep #$20
  lda.w #$ffff
compara_tempo_exibicao_2:
  cmp #$0000
  beq tempo_exibicao_001_2
  dec
  WaitHV()
  bra compara_tempo_exibicao_2
tempo_exibicao_001_2:
  lda.w #$7fFF
compara_tempo_exibicao_001_2: 
  cmp #$0000
  beq sair_splash_2
  dec
  WaitHV()
  bra compara_tempo_exibicao_001_2                                
sair_splash_2:
  sep #$20
  FadeOUT()
  WaitNMI()  
}

  sei     //-Set Interrupt - Desabilita os interruptores
  cld     //-Clear Decimais
  rep   #$10
splash_one:
  ClearVRAM($A2D211, $F800, $FFFF, 0) // - limpa a vram
  WaitNMI()
  LoadVRAM($A2D90A, $0000, $2040, 0)     // Carrega o gráfico na VRAM da primeira Splash
  WaitNMI()
  LoadVRAM($A3804A, $6000, $2400, 0)     // Carrega o gráfico na VRAM da segunda Splash
  WaitNMI()
  LoadVRAM($A3A44A, $8400, $2500, 0)     // Carrega o gráfico na VRAM da segunda Splash
  //LoadVRAM($A4B100, $D600, (gfx_logo_end-gfx_logo), 0)     // Carrega o gráfico na VRAM do Logo 
configura_modo_video: //-- Configura o modo de vídeo (2bpp, 4bpp, 8bpp,)
  LoadVRAM($A2D20A, $E800, ($A2D90A-$A2D20A), 0) // CarrEga Tilemap do gráfico na VRAM
  LoadPAL($A2A1EA, $00, ($A2D20A-$A2A1EA), 0)  // Carrega a paleta na VRAM

  lda.b #%00001011   // --- Configura Modo de Cores dos BGS        
  sta.w REG_BGMODE

configura_bg1:
  lda.b #%11110101            
  sta.w REG_BG2SC    // --- Configura endereço do Tilemap
  lda.b #%00000000           
  sta.w REG_BG12NBA  // --- Configura o endereço dos Tiles
  lda.b #%00000010            
  sta.w REG_TM       // --- Configura BG1 como tela principal


tempo_da_splash_1:
  time_splash() 

carrega_na_vram_tilemap_e_paleta_da_splash_2:
  LoadVRAM($A48000, $E800, $700, 1) // CarrEga Tilemap do gráfico na VRAM
  LoadPAL($A2F92A, $00, $20, 0)  // Carrega a paleta na VRAM
//carrega_na_vram_tilemap_e_paleta_do_logo:
//  LoadVRAM($A49D00, $E800, (tilemap_logo_end-tilemap_logo), 1) // CarrEga Tilemap do gráfico na VRAM
//  LoadPAL($A48B00, $00, (paleta_logo_end-paleta_logo), 0)     // Carrega a paleta na VRAM

configura_modo_video_2: //-- Configura o modo de vídeo (2bpp, 4bpp, 8bpp,)
  lda.b #%00110000            
  sta.w REG_BG12NBA  // --- Configura os Tiles
  lda.b #%00000010            
  sta.w REG_TM       // --- Configura BG1 como tela principal 
  
  jml $A48B00


//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//------------------------  Clean the VRAM  ---------------------------------
//------------------------  Limpar a VRAM  ----------------------------------
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
limpa_vram:
  dw $0000
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx




//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//----------------------------  Splash  -------------------------------------
//----------------------  Tela de introdução  -------------------------------
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//---------------------  Splash's First Screen  -----------------------------
//--------------------  Primeira Tela da Splash   ---------------------------
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
// $A2A1E8 - $A2D208
origin $3151ea
paleta_splash_one:
  insert "pal\palette_splash1.bin"
paleta_splash_one_end:
// $A2D208 - $A2D908
origin $31520a
tilemap_splash_one:
  insert "tilemap\tilemap_splash1.bin"
tilemap_splash_one_end:
// $A2D908 - $A2F928
origin 3234058
gfx_splash_one:
  insert "gfx\splash_1.bin"
gfx_splash_one_end: 

//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//---------------------  Splash Second Screen  ------------------------------
//--------------------  Segunda Tela da Splash  -----------------------------
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
// $A2F928 - $A2F948
// $A2F92A - $A2F94A
origin $31792A
paleta_splash_two:
  insert "pal\palette_splash2.bin"
paleta_splash_two_end:
// $A2F948 - $A38048
// $A2F94A - $A3804A
origin $320000
tilemap_splash_two:
  insert "tilemap\tilemap_splash2.bin"
tilemap_splash_two_end:
// $A38048 - $A3C8A8
// $A3804A - $A3AE78
origin $31804A  
gfx_splash_two:
  insert "gfx\splash_2.bin"
gfx_splash_two_end: 
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
origin $320B00
tempo_da_splash_2:  
  time_splash_2()

  jml $0091F5