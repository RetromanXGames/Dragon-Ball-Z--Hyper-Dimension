torneio:
    
    // INTRUCOES ORIGINAIS DE ONDE EU COLOQUEI O DESVIO

    jsl     $00da00

    lda $054e
    cmp #$02           
    beq carrega_grafico_torneio
    cmp #$01           
    beq carrega_grafico_torneio
    cmp #$00           
    beq carrega_grafico_torneio
    bra torneio_retorno


carrega_grafico_torneio:
    ldx     #($0200>>1)   // VRAM Dest* | endereço de destino do grafico na VRAM (aonde vou sobreescrever)
    stx     VDP_DATA
                          // USAR QUANDO BUGAR A ROTINA
    rep     #$30          // Coloca em MODO 16 BITS o processador

    lda     #$0001        // DMA Mode
    sta     REG_DMAP0
    lda     #$0018        // DMA Dest
    sta     REG_BBAD0
    ldx     #$B600        // DMA Src* | Endereço de SNES do gráfico na ROM
    stx     REG_A1T0L
    lda     #$00A0        // DMA Bank*| Banco de SNES do gráfico na ROM
    sta     REG_A1B0
    ldx     #(torneio_grafico_end-torneio_grafico)        // Size* | Tamanho do grafico FIM DO GRAFICO - INICIO DO GRAFICO
    stx     REG_DAS0L

    lda     #$0001        // DMA Start
    sta     REG_MDMAEN
	
                          // USAR QUANDO BUGAR A ROTINA
    sep     #$20          // Coloca em MODO 16 BITS o processador // brk - modo errado

torneio_retorno:
    // RETORNO
    jml     $0e8447