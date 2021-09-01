ready:
    // INTRUCOES ORIGINAIS DE ONDE EU COLOQUEI O DESVIO
    jsl     $00a21c



    ldx     #($d600>>1)   // VRAM Dest* | endereço de destino do grafico na VRAM (aonde vou sobreescrever)
    stx     VDP_DATA
                          // USAR QUANDO BUGAR A ROTINA
    rep     #$30          // Coloca em MODO 16 BITS o processador

    lda     #$0001        // DMA Mode
    sta     REG_DMAP0
    lda     #$0018        // DMA Dest
    sta     REG_BBAD0
    ldx     #$aa00        // DMA Src* | Endereço de SNES do gráfico na ROM
    stx     REG_A1T0L
    lda     #$00A0        // DMA Bank*| Banco de SNES do gráfico na ROM
    sta     REG_A1B0
    ldx     #(ready_grafico_end-ready_grafico)        // Size* | Tamanho do grafico FIM DO GRAFICO - INICIO DO GRAFICO
    stx     REG_DAS0L

    lda     #$0001        // DMA Start
    sta     REG_MDMAEN
	
                          // USAR QUANDO BUGAR A ROTINA
    sep     #$20          // Coloca em MODO 16 BITS o processador // brk - modo errado

    // RETORNO
    jml     $0e80e2