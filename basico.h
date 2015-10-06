#ifndef BASICO_H
#define BASICO_H

/* Funções de bit */
#define BIT_SET(arg, bit) ((arg) |= (0x01 << bit))
#define BIT_CLR(arg, bit) ((arg) &= ~(0x01 << bit))
#define BIT_FLP(arg, bit) ((arg) ^= (0x01 << bit))
#define BIT_TST(arg, bit) ((arg >> bit) & 0x01)

#endif