let testInput =
"""
Card   1: 58  6 71 93 96 38 25 29 17  8 | 79 33 93 58 53 96 71  8 67 90 17  6 46 85 64 25 73 32 18 52 77 16 63  2 38
Card   2: 34 79 17 22 15 73 61 58 46 32 | 36 53 22 32 56 15 71  7 17 19 79 81 44 59 46 34 52 61 24 73 54 28 88 50 58
Card   3: 20 71 73 21 96 61  4 66 19 47 | 55 31 54 72 47  2 61 19 36  4 92 64 68 20 96 21 75 49 73 67 66 26 12 71 98
Card   4:  6 34 71 49 82 67 22  9 72 96 | 49 32 84 82  2 72 60 67 14 99 22  9 38  6  7 34 91 83 43 96 74 40 71 53 58
Card   5: 76 99 87 97 16 61 73 20 22 19 | 83 27 89 80  1 84 23 21 35 12 60 17 63 26 88  3 70 49  6 34 30 77 59 82 66
Card   6: 26 46 80 73 50  3 44 27 87 96 | 92 46 76 87 50 27 58 68  3 47 93 80 41 64 26  9 96 43 63 73 91 74 22 53  7
Card   7:  6  7  4 44 94 90 19 42 70 53 | 44  2 59 94 99 28 34 48 39 72 96 27 14 92 87 84 74 85 47 69  6 67 17 31 33
Card   8: 17 88 30 94 59 60 79 90 18  9 | 88 94 96 59 18 34 30 86 62 16  2 79  9 70 60 17 95 91 73 40 90  4 93 15 39
Card   9: 44 38  8 48  5 84  6 53  7 86 | 77 36 97 84 91 34  6 13 86 52 38 45 27 16  5 56 72  8  7 99 53 44 31 57 48
Card  10: 89 97 85 41 94 37 36 79  8 64 | 83 34 66 32 49 80 86 84 52 43  5 25 73  7 74 55 72 78 63 14 28 48 16 75 30
Card  11: 33 18 46 65 44 14 99 56 38 80 |  5 48 85 25 70 52 97 99 56 45 26 92 49 24 81 96 65 42 72 16 78 46 54 10 13
Card  12: 43 48  2 90 99 20 69 51  6 88 | 88 99 52 79 80 29 43 51 19 62 66 18 23 32 55 60  7 85 90 16  2 46 27 69  9
Card  13: 67 73 47 37 96 88 65 52 19 10 | 49 28 84 78 11 54 17 86 74 56 89 95 91 98  4 67 61 60 50 94 12 48 77 62 66
Card  14: 22 49 71 37 92 30 54 47 26 68 | 35 67 76 96 27 89 43 58 82 11 17  8 94 77 69  3  9 29 39 55  6 87 84  7 46
Card  15: 28  5 65 51 76 96 35 98  2 62 | 76  5 24 14 81 26 32  2  6 50 65 71 96 90 70  7 39 49 66 79 19 85 44  3 61
Card  16: 13 93  1 50 51 28 73 67 56  4 | 12 81 20 82  9 48 21 78 36 17 76 35 57 91 18 27 11 16 49 23  5 65 58 29 62
Card  17: 68 53 93 91 64 77 41 32 86 19 | 60 92 44 54 71 94 52 82 66 11 97 89 10 35 86 99 79  3 20 25 70 56 91 62 74
Card  18: 24 60 95  5 52 71 82 55 31 45 | 59 87  7 49 77 80 27 62 78 53 14 90  3 96 44 54 91 30 17 51 73 12 66 84 20
Card  19: 49 84  1 12 28 56 55 19 57 59 | 44 50  5 99 38 63 20 84 31 66 73 36 53 10  7 21 15 67 77 76 19 25 52 61 98
Card  20: 43 12 26 91 27 66 49 95 14 18 | 47 73 40 85 89  1 17 48 52 39 88 50 58 19 16 68 65 38 32 97  4 34 75 91 54
Card  21: 46 50 63 61 32 33 47 86 68 35 | 81 91 38 11 76 37 77 75 49 78 33 66 30 72 57 59 15 52  5 50 13 47 71 69 35
Card  22: 45  7 69 50 42 94 19 64 26 96 | 22 89 37 56 72  3 80 11 70 42 61 52 87 65 86 90 31 39 53 91 23 81 62  9  4
Card  23: 23 43 20 98 69 73 31 27 67 97 | 88 26 62 10 42  4 85 74 66 59 90  6 89 54 68 87 18 23 40 15 93 29 55 47 70
Card  24: 35 70 13 23 19 50 58 91 69 99 | 38 94 91 60 63 92 55 74 62 15 26  4 52 28 78 10 46 89 87 53 37 32 85 18  2
Card  25: 13 22 42 58 15 55 47 50 63 32 | 25 45 78 98 65 44 12 43 89 72 11 14 82 59 28  3 76 57 66 20 18 35 39 77 64
Card  26: 33 62 41 81 19 10 99 64 63 85 | 11 81 85  2 52 19 64 15 33 59 99 54  1 10 43 96 56 84 58 53 12 41 63 62 94
Card  27: 79 65 92  3 84 89 34 15 87 45 | 19 23 35  4 99  7 78 27 11 83 69 56 42 76  8 49 28  3 74 92 63 38  1 34 44
Card  28: 64  4 50 16 29 87 18 34 61 11 | 29 61 50 87 16 94 51 47 37 41 11 49  9 93  4 80 57 99 64 54 53 33 32 18 84
Card  29:  3 32 57 88  4 78 10  9 90 46 | 46 80 57 10 93 38 22 74  3 90 27 64 19 14  4 65 96 40 13 88 89  9 47 78 32
Card  30: 68 71 42 36 14 87 63 28 47 39 | 55 37 48 34 52 35  3 67 68 47 98 62 22 27 18 87 29 38 80 14 65 82 31 92 50
Card  31: 17 78 64 30 60 53 82  7 65 72 | 80 99 55 49 65 32  7 54 72 90 30 26 95 82 88 48 17 60 64 53 20 78 27 61 86
Card  32: 54 20 29  6 14 24 25 18 38 97 | 31 99 20 39 59 28 12 16 30 76 10 69 48 56  8 15 72 13 62 42  3 51  9 40 83
Card  33: 25 27 63 97 95  6  8 42 41 96 | 95 75 50 49 77 13 22 21 16 97 46 64 27 37 32 18 76 41  8 20 11 40 33 25  6
Card  34: 73 43 53  1 87 52 56  9 26 83 | 55 56 82 28  5 74 14 25 53 87 86 70 52 83 77 90 57 31  9 19  3 26  1  8 60
Card  35: 76 73 77 43 83 52 24 44 18 26 | 91 54 18 36 47 17 63 50 59  6 15 11 74 48 33 83 67 97 73 16 24 44 60 26 46
Card  36: 93 29 51 71 43 41 73 91 89 58 | 87  7 41 21 89 25 91 20 99  3 13 58 95 30 51 31 98 53 15 22 29 81 45 47 73
Card  37: 36 68 86 66 61 81 76 79 20 64 | 92 66 53 73 88 48 29 81 82 36 89 79 72  9 10 99 84 64 24 51 15 68 61 76 20
Card  38: 46 68 48 82 27 94 79 10 41 14 | 57 94 11 10 14 40  9 72 36 41 79 65 99 66 82 46 43 22 49 24 48  2 90 47 89
Card  39:  3  9 91 15 86 68 28 89 67 29 | 14 63  8 58 15 91 59 28 29 12 80 62 53 86 89 51 68 72 69 66 11 90  9 18 78
Card  40: 40 51 46 81  7 35 94 96 23 16 | 18 94 61 51 50 27 46  9 99 85 29 36 84 43 81 71 56 38 23 96 40 16 28  1 88
Card  41: 87 20 88 12 65  4 18 52 74 10 |  9 10 78 81 11 20 98 52  4 14 77 45 80  1 18 65 49 79 91  8 53  6 88 12 92
Card  42: 44 94 36 68 31 26 76 89 16  1 | 76 52 28 68 43 17 74 44 87 94 63 20 36 51  1 83 42 56 67 49 57  8 31 72 93
Card  43: 68 65 53 58 78 28 46 10 91 80 | 21 65 99 85 60 35 26 39 68 64 30 58 91 59 54 93 76 67 78 19 74 82 71 50 80
Card  44: 71 59 82 37 51 19 57 24 52 80 | 97 74 98 13 91 70 85 61 36 43 90 12  6 75 93  7 89 84 15 73 11 41 34 86 47
Card  45: 25 40  3 51 19 69 68 27  7 62 | 55 59 45 78 87 48 13 50 94 46 65  1 66 21 70 28  8 81 42  2 23 36 54 26 10
Card  46: 39 51 95 90 80 83 19 73 41 54 | 81 78 62 18 58 84 83 71 31 88 43 86 28 70  5  4 24 34 85 33 72 53 23 94 61
Card  47: 14 66 55 61 88 12 96 67 75 28 | 42 93 33 19 18 96 48 26 11 89 68 99 49 78 38 10 67 23 62  3 97 53 52 83 35
Card  48:  8 88 37 27 45 30 87 79 46 75 | 57 60 56 40 67 51 59 35 93 77 41 95 14 82 96 11 87 34 52 62 94 78 92 98 20
Card  49: 94 76 65 30 99 20 32 90 51 87 | 36 29 68 97 48 38 57 10  3 43 24 86  9  6 54 92 67 75 15 98 81  7 60 14 58
Card  50: 88 12 95 13 44 80 51 76 66 42 | 76  2 51 28 37 55 30 19 83 12 44 82 34 39 33 70 13 80 66 32 42 71 27 72 88
Card  51: 16  5 28  7 22 50 71 32 18 61 | 33 71 65 61 75  5 41 44  7 27 50 51 32  3 22  8 42 34 18  1 16 70 28  6 58
Card  52: 45 25 80 42 79 37 70 88 59 97 | 62 45 83  8 59 27 97 30 61 85 69 67 70 28 65 87 41 43 42 37 80 25 79 88 18
Card  53: 95 69 14 72 76 77 21 74 54 96 | 12 22 14  8 23 26 76 68 95 86 27 84 50 21 69 96 74 54 71 82 56 77  1  6 72
Card  54:  5 45 68 98  6 14  9 50 85 42 | 22 99 92 36 93 17 27 51 53 71 12 54 52 50 35 40  5 76 28 66 63 85 74 65 44
Card  55: 63 20  6 57 60 77 80  5 12 66 |  4 95 35 10 13 11  1 69 51  5 23 31 80 24 87 22 63 46 60 79 68 90 77 47 74
Card  56: 83 62 93 85 15 30 53 31 96  2 | 98 66 27 91 36 89 41 74 12 21 23 76 57 24 15 55 88 47  3 19 60 30 83 85 92
Card  57: 32 35 33 46 44 76  2 26 87 50 | 12 84 25  8  3 87 76 33  7 44 18 19 47 32 35  2 30 46 70 50  1 78 10 65 26
Card  58: 19 64 82 63 11 24 68 77 91 20 | 64  1 85 30 20 52 16  8 19 10 11 56  4 82 15 68 63 77 24  2 83  6 91 76  5
Card  59: 57 97 98 91 30 21 59 84 93 53 | 73 68  3 98 77 78 86 30 31 89 74  7  1 38 90 53 50 91 84 46 57 93 97 59 21
Card  60: 49 43 92 57 25 60 26 85 69 88 | 25 69 71  3 49 41 89 96 52 12 92 97 26 83 57 66 62 24 23 28 98 43 82 80 85
Card  61: 60 18 69 89 45 21 41 30 95 55 | 75 41 44 60 36 97  3 45 33 17 20 62 98 89 59 72 39 80 47 85 42 90 82 23 69
Card  62: 67 25 34 10 49 41 45 80 65 33 | 65 53 11 21 67 90 45 96 80 19 81  7 30 64 33 34 10 39 29 98 57 68 89 54 41
Card  63: 16 94 89 92 17 86 69  3 66 96 | 41 79 64 61 59 76 33 81 31 26 80 16 52 14 98  9  3 47 89 66 63 92 86 84 56
Card  64: 59 94 14 65 69 22 36 27 91  3 | 21 45 23 11 15 56 36 32 40 69 92 78 83 25 94 80 33  9 90 63 81 24 96  7 35
Card  65: 73 42 88 31 97 92 50 15 77 35 | 83 42 60 34 33  4 82 47 70 23 81 36 52 97 17 30 59 49  9 85 93 22 43  7 50
Card  66: 24 40 81 73 60 14 20 31 28 88 | 15 49 73 72 23 36 50 16 14  2 61 44 57 96 27 93 60 24  6 94 91 92 18  8 74
Card  67:  9 18 16 28 86 23 65 81 52 59 | 77 87 31  1 20 89 93 15 32 62 75 68  5 39 11 55 38 95 40 96 78 19 37 74  4
Card  68: 73  4  5 13 92 85 20 24 75 55 | 42 87 30 72 95 17 28 66 61 15 96 93 97 27 43 76 63 81 70 68 64 32 25 53 33
Card  69: 62 89 91 68 44 21  1 19 33 30 | 35 98 83 66 43 61 26 15  2 12 76 72 42 79 74 28 16 63 77  7 56 64 78 65 47
Card  70: 43 27 74 56 26 77 59 72 33 20 | 25 89 86 85 96 82 69 16 60 55 99 95 31 73  5  8  9 92 83 53 21 32 23 71 78
Card  71: 45 35 27 62 58 94 90 28 99 75 | 19 61 39 74 72 47 37 71 40 79 63 26 23 48 36 59 77 21 92 17 38  4  8 20 42
Card  72: 36 43 39 45 58  2 38 12 69 74 | 14  2 81 80 85 12 38 43 49  4 88 69 74 40 39 28 67 58 89 13 68 45 36 87 79
Card  73: 77 30 36 41 31  9 70 22 66 88 | 66 32 35 20 47 37 36 25 13  9 41 54  2 77 84  5 63 21 99 59 31 67 88 22 70
Card  74: 82 10  5 28 32 30 73  9 55 53 | 27 43 28 22 64 36 55  5 53 90 29 73 44 49 32 69 14 52 45 23 70  3  2 15 66
Card  75: 95 12 69 24 85 10 84 71 64 98 | 71 19 66  9 25 37 77 29 15 62 38 10 72  2 50 54 97 14 17 26  1 48 89 55 95
Card  76: 50 77 72 64 93 82 28 65 57 43 | 39 89 70 54 86 49 83  5 56 57 12 32 28  3  7 38 51 34 22 66 84 19 73 50 71
Card  77: 63 96 47 98 32 37  4 30 71 65 | 65 71 88 46 59 98 45 90 37 47 68  8 23 32 57  4 96 93 41 63 51 64 70 30 40
Card  78: 16 63 74 26 24 61 99 41 91 85 | 73 50 67 14 57 93 91 63  7 75 99 85 66 62 95 88 77 53 64 94  1 96 15 16 36
Card  79: 36 89  1 72 14  7  9 60 77 38 | 72 87 77 96  2  9 60 89 95 38 19 35 27 54 18 56 14 99  7 74 62 61 80 53 84
Card  80: 74 14 52 76 87 19 36 57 37 67 | 51 65 26 11  5 87 22 21 94  9 41 79 93 67 52 74 36 75 76 96  8 81 14 60  1
Card  81: 93 11 67  3 25 68 63 62 24 37 | 19 26  2 93 90 69 42 10 89 80  4  1 45 61 67 36 34 68 94 35 50 38  3  6 53
Card  82: 37 23 20 54  2 76 87  9  8 31 | 31 62 37 13 32 43 40 72 87 44 20 42  1 29 93 51 69  8 53 76 91 34 23  2 54
Card  83: 91 30 31 27 81 85  9 75 22 44 | 85 23 84 59 81 90 75 70 52 88 44 86 31 15  9 68 30 93 91  6 12 65 27 57 22
Card  84: 23 19 67 74 60 95 37 90  6 45 | 36 62 26 71 94 67 96 21 18 99 84 23 19 95 82 60 30 45  4 29 75 80 90 43 74
Card  85:  8 76 86 35 99 57  5 15  7 49 |  8 49 79 69 43 46 76 84 22  1 68 52 99  5 53 93 27 15 63 95 57  3 13 61 24
Card  86: 97 17 85 58  9 44 99 73 27 57 | 96 85 57 60 64 68 18 36 79 97 45 43 55  1 26 31 73 44 14 39 78 27 76 99 63
Card  87: 69 82 19 43 22  6 80  5 99 88 |  8 91 86 13 57 63  9 52 37 96 81  3 90 17 60 44 41 89 39 29  1 70 55 21  4
Card  88: 44  8 41 84 38 91 70 31  1 50 | 60 83  4 51 49 88 90 14 34 45 70 25 56 23 91 11 38 41 48  7  2 19 28  9 27
Card  89: 28 35 54 91 33  5 21 60 16  4 | 93 15 81 77  5 53 26 19 25 66 97 59 14 95 16  1 22 38 31 48 37 88  3 12 54
Card  90: 10 34 24 28 91  5 29 69 93 17 | 58 82 43 79 78 51 48 66  2 76 37 70 52 94 15 53 88 16 32 23 38 59 83 44 31
Card  91: 92 62 95 29 58  9 21  4 19 26 | 80 84 51 76 97 52 87 38 27 25 53 42 19 39 13 66 79 63  7 59 73 72 85 50 37
Card  92: 81 89 79 75 73 76 74  2 91 53 | 48 63 70 58 65 37 60 86 64 36 16 15 32 66 35 76 78 54 25 94 45 30 71 21 83
Card  93: 73 98 81 39  9 80 26 71 95 60 |  3 79 34 16 30 68 21 31 18 52 62 89 69 58 59 93 48 17 41 40 22  2 91  6 86
Card  94: 47 67 80 63 87 90 55 95 91 82 | 55 10 91 39 63 95 50 82 83 43 87 67 69 31 78 94 71 28  8 32 47  5 80 56 90
Card  95:  8  7 32 67 13 17 27 48 79 21 | 95 96 92 88 53 27  4 21 13 32 40 48 11 61 17 67 79 45 43 59  7  8 89 57 86
Card  96: 30 23  1 77 92 31 27 67 39 55 | 77 87  3 92 31 90 58 67 71 60  1 30  8 27 23 17 86 64 55 39 82 43 44 33 99
Card  97: 63 41 31 38 34 23  2 48 88 89 | 28 35 15 11 17 69 97 87 45 55 44 53 23 57  9 80 48 60 12 88 64 13 54 31  7
Card  98:  1 90  5  6 10 60 23 21 43 53 |  6 10 60 80  5 50 69 39 76 23 21 66 70 44 53 81 34 65 90  1 43 85 31 98 59
Card  99: 55 82 70 51 75 40 87  9 47 69 | 42  4 25 70 51 94 88 40 49 32  6 77 65  1 71 83 39 64 55 47 79 45 12 24 17
Card 100: 28 69 65 17 11 29 93 21 83 23 |  9 42 55 49 62 20 95 56 30 43 54 71 32  3 58 19 16 82 41 21 51 59 80 23 63
Card 101: 45 90 87 94  6 97  5 68 42 41 |  1 36 14 83 59 26 54 76 94 42 80 27 66 17 93 11 68 67 47 10 39 45 75 89 34
Card 102: 65 25  7 97 66 83 57  1 61 51 | 17 74 50 84 54 69 18  2 30 86 25 16  5 48 58 34 78 97 12 66 53 61 46 44  8
Card 103: 82 13 35 92 39 89 91 77 94 29 | 50 30 37 52 59 21 58 29 77 51  1  6 35 42 45 26 90 83 55  4 65 39 79 89  9
Card 104: 17 40 30 48 90 87 16 97 14 79 | 44 39 22 99 49 50 71 23 45 38 97 61 86 35 20 12 67 59 28 47 72 81 34 83 25
Card 105: 40 92 69 84 33 10 55 99 75 98 | 99 46 59 18 70 80 42 24 17 92 77 65 35 51 11 40 34 16 90 15 88 69 37 87 84
Card 106: 83 86  9 38 42 96 32  8 98 40 | 24 35 65 56 93 37 91 31 57 15 76 42 19 12 67 83 29 30 81 66 87 94 80 18 92
Card 107: 91 42 90 28 34 32 83 98 35 84 | 30 72 31  3 97 35 53 11 10 80 69 73 23 26 81 74 42 36 77 61 39 56 71 65 62
Card 108: 45 53 47 86 13 25  5 66 68 71 | 38 35 56 11 82 80 94 31 10 74 93 29 65 90 27 75 60 39 99 97 55 92 37 57 17
Card 109: 14 53 91  5 61 97 35 77 85 96 | 29 40 83 55 25 66 67 44 26  2 69 11 64 94 32 45  3 33  6 98 13 22 27 71 81
Card 110: 81 83 71 72 44 46 59 10 47 18 | 64 76 97 93 52 38 94 28 51 48 17 22 69 79 98 30 14 31 20 66 89  2  9 55 21
Card 111: 16 59 24 35 39 41 28  5 54 10 |  9 60 72 89 43 41 68 52 59 87 54 93 90 23 32 35 94 28  5 24 16 42 99 10 39
Card 112: 31 76 81 11 50 62 40 13 57 66 | 40 21 77 95 56 76 66 22 12 46 52  1 57 64 63 83 25 49 62  3 81 94 87 11 98
Card 113: 16 69 20 92 59  2 38 54 10 90 | 24 22 37 30 57 82 59 51 81 38  1 79 15 62 74 84  2 20 92 96 16 90 95 29 69
Card 114:  9 66 93 18 40 58 25 36 72 50 | 55 33 82 40 96 68 95 58 43 18 93 50  8  9 94 47 36 23  7 38 75 24 66 72 25
Card 115: 22 37 56 62 21 64 98 43 61 80 | 22 41  3 71 98  1 51 15 72 10 54 32 61 13 84 78 52 57 80 53 26 40  2 25 86
Card 116: 61 62 48 15 90 76 18 11 97 89 | 33 12 69 15 82 24 38  6 61 28 40  1 54 50 81 76 68 59 26 94 43 20 51  4 58
Card 117: 48 42  9 20 61 95 88 30 74 92 | 44 23  9 18 98 14 34 95 37 42 92 74  5 20 83  3  2 48 89 78 72 30 81 97 90
Card 118: 35 19 87 33 11 86 16 79 90 50 | 41 64 61 83 53 30 94 86 98 68 44  1 32 34 35 79 58 21 19 84 85 25 73 67 24
Card 119: 72 99 25 49 16 68  6 89 31 81 | 80 97 11 62 41 96 27 89 49  3 25  6 99 94 26 34 55 81 48 75 53 72 68 16 28
Card 120: 78 77 54 70  9  6 22 43 40 16 | 48 20 54 25 75 91 33 67  3  5 95 37 29 90  1 24 32 39 12 51 71 16 36 76 63
Card 121: 76 19 51 52  4 18 32 43 34 55 |  4 52 51  1 32 37 80  6 76 73 88 43 82 19 89 34 55 18 25 58 85 23  9  5 60
Card 122: 62 13 36  6 12 87 37 89 71 61 | 61 96 35 57 41 27 52 82 22 26  6 87 14 72 73 84 68 29 39 15 16 75 12 62 37
Card 123: 94 85 49 16 75 95 74 50 47 56 | 88  8 26 90 49 17 50 75 97 99  9 16 31 95 74 94 71 91 38 85 51 86 47 77 53
Card 124: 42 47 86 68 46 12 76 11 92 28 |  8 87 93 61 58 91 53 34  4 51 50 17 73 84  6 60  3 31 65 22 90 95 85 19 49
Card 125: 17 90 29 11 62 72  8 80 86  9 |  1 86  3  9 56 29 52 46 21 30 62 11 75 89 20 97 80 53 19 99 23 90  7  8 15
Card 126: 83 45 41 89 78 37 17 19 68 75 | 65 50 14 67 75 31 88 87 64 36 44 17 37 19 63 40 89 78 43 85  7 10 72 13 41
Card 127: 69 31 24 29 32 70  5 34 96 46 |  5 68 54 12 42 75 84 23 18 79 82 50 40 36 87 77 73 53 57 88 32 33 39 71 22
Card 128: 25 31 17 76 94 82 77 44 68 62 | 64 81 29 78 68 80 38 93 27 90 69  9 88 15 47 11 73 28 42 57 51 70 13  5 26
Card 129: 84 92 55 44 86 23 18 57 15 40 | 88 94 32 19 26 39 28 25 52 49 51 81 72 27 50 62 31 29 87 66 67 14 20 12 73
Card 130: 97 57 99 82 46 73 48 25 47 12 | 30  5 77 75 35 67 18 37 52 64 74 38 11 59 41 68 80 73 83 46 71 36 33 84 47
Card 131: 84 17  4  1 23 73 32 15 35 62 |  7 65 66 27 18 47 21 83 31 99 96 88 78 42  8 80 68 97 59 30 13 72 10 41 22
Card 132: 17 45 87 44 13 68 85  3 99 21 | 64 53 78 93 49 57 79 60 90 10 63 27 68 55  4 91 73 92 83 26 70 35  8 41 97
Card 133:  5 80 43 78 74 47 32 20 58 85 | 35 82 68 63  3 59 14 99 45 55 98 23 71 44  9 97 18 75 66 56 29 24 13 25 79
Card 134: 84 91 50  6 28 57 78 74 44 14 |  3 78 32 35 31 59 45  5 89 23 11 38 49 40 82 65  4 19 17 33 60 77  7 71 62
Card 135:  6  8 19 28 38 13 40 47 41 94 | 91 98 56 94 57 45 41 47 97 93 58 32 37 21 15 73 76 62 90 55 18 88 79 87  6
Card 136: 15 94 90 19 71 20 62 46 47  9 | 47 19 84 83 53 28 71 91 61 77 43 38 27 15 42 23 97 48  7 52 46 76 81  9 57
Card 137: 39 63 44 23 98 65 35 24 72 50 | 81 88  3 67 50 23 78 79 70 39  8 95 19 83 35 59 63 44 72 45 98 18 24 25 65
Card 138: 33 56 23 48 32  7 83 52 39 63 | 38 33 34 84 70 74 56 13 95 52 59 22 77 75 20 58 72 16  7 28 61 14 50 83 55
Card 139: 27 70 34 76 48  1 40 43 32 78 | 16 96 11 72 55 34 99 17 48 94 38 64 92 40 87 43 80 10 32  1 49 86 77 57 78
Card 140: 80 40 91 86 71 81 41 54 72 53 | 40 64 71 38 22 60 92 14 72 90 81 62 23 86 29 52 73 17 95 67 91  6 19 44 26
Card 141: 56  2 30 33  6 79 77 71 69 85 | 13 11 65 30 74 40 37  6 79 61 56 44 90 69 19 27  2 35 33 59 76  4 85 45 77
Card 142:  9 23 40 75 53 63 48  3 27 22 | 71 96  7 94 28 55 64 91 56  8 84 88 38 21 51 17 72 46 76 30 14  1 39 85 58
Card 143: 84  9  6 14 90 71 60  8 86 59 | 81 55 12 27 44 88 49 51 15 20 79 16 75 25 89 33 56 66 34 65 46 77 98 58 73
Card 144: 13 95 62 75 80 30  4  5 97 38 | 81 39 67  8 28 59 35 38 92 84 73 23 48 13 16 64 30 52 88 41 15 99 18 86 11
Card 145: 98 14 62 40 99 86 80 95 25 48 | 99 14 98  4 87  8 80 67 20 61 69 55 56 95 48 79 38 29 12 25 77 39  1 70 78
Card 146: 56 60  7 64 40 95 76 28 72 14 | 45 34 63 69 72 21 97 84 22 94  7 96 77 23 47 98 64 42 76 87 95 12 55 14 75
Card 147: 32 94 15 70 38 73 91  1  9 10 | 87  6 73 33 95 27 11 21 56  7 57 62 26 89 41 75 22 44 71 42 90 85  8 14 98
Card 148: 46 59 96  7 79 82 26 44 55 37 | 31 69 32 61 43 11 66 42  5 21 29 98  3 16 94 62 95 26 17 88  7 86 54 24 91
Card 149: 63 37 31  6 84 53  5 88 23 27 | 58  9  3 46 42 66 68 77 74 21 76 10 79 25 39 70 33 35 90 51 88 40 96 86 49
Card 150: 70 53 20 30 92 11  2  8 64 69 | 63 60 58 96 31 75 35 61 74 67 50 45 78 69 81 26 88 24  9  8 43 20 19 95 91
Card 151: 59 66  9 52 37 63 47 86  8 97 | 31 10 87 13 90  9 12 71 45  7 56 93 58 67 49 35  1 24 27 29 94 40 74 26 79
Card 152:  8 15 20 57 56 78 34 98 46 92 | 94 38 33 99 63 62 95  5 85 81 80 13 28 48 96 36 51  4 25 22 90 40  9 39 47
Card 153: 91 39 26 11 12 90 63 73 98 19 | 43 93 76 97 82 75 71 80 92 55 61 54 51 49 94 37 21 42 74 87 31 44  9 70 33
Card 154: 96 52 59 41 86 90 63  3 77 23 |  8 66 89 65 74 34 73 20 21 47 77 85 91 87 51 28 97 24 69  2 82 60 50 15 19
Card 155: 48 69 13 68  5 29 28 12 22 37 | 73 52 43 37  5 44 28 69 29 76 68 26 51 35 17 90 48 55 60 83 46 13 22 39 34
Card 156: 32 26 55 22 93 14 30 33  9 84 | 24 82 83 40 22 79 52 23 11  3  9 78 70 37 26 44 54  1 20 65  6  2 67 61 77
Card 157: 53 23 58  5 22 11 46 77 47 43 | 35 92 73 96 46 41 11  5 74 95 66 22  9 19 63 58 48  4 80 31 53 91 77  1 14
Card 158: 90 13  3  4 94 85  8 83 60 14 | 30 67 46 60 43 23 73 51 50 29 97 92 57 52 14 59 90 63 33 69 77 21 70 66  3
Card 159: 14 86  9 87 80 21 41 72 17 32 | 51 68 57 84 20 21 34 44  6 67 26 38 46  2 16 37  1 69 77 81 73 10 33 62 52
Card 160: 45 51 83 25 31 63 26 94 56 40 | 91 72 31 84 22  1 51 52 25 83 40  5  2 41 17 63 45 56 54 86 97 94 67 19 26
Card 161: 27 43 80 23 67 45 68  4  5  3 | 35 83 36 69 92 20  6 49 87 27 60 11 32 71 91 53 66 47  3 23 88 74 68 50 67
Card 162: 81 73 42  3 39 37  9 23 59 94 | 75 17 11 93 30 16 70 29 27 47  1  4 12 73 79 96  5 85 39 13  6 56 44 92  3
Card 163: 87 97 59 11 71 25 46 86 54 48 | 21 25 12 72 55 34 11  1 70 22 59 26 86 20  9 56 84 19 14 58  2 77 50 91 13
Card 164: 40 23 99  8 80 75 30 52 92 88 | 37 66  5 68 62 84 73 99 92 26 28 15 67 14 54 51 30 69 75 39 23 34 27 72  3
Card 165: 34 30 43 14 61 33 73 56 15 93 | 89  5 65 25 93 28 69 81 22  1 78 39 62 85 95 75 18 98 57 50 35 30 70 36 51
Card 166: 16 74 94 44 71 60  7 90 84 40 |  5 12 70 45 49 71 61 91 48 75 53 30 65 55 11 89 88 67 76 25 77 24 15 16 81
Card 167: 37 65 12 71 39 64 75 58  3 60 | 13 81 69 59 99 29 87 22 91  2 16 70 39 44  1 46 67 60 54 90 96  5 86 58 75
Card 168: 76 44 60 13 10 42 87 34 58 93 | 88 73 48  2 99 35 37  4 69 82 15 81 43 21 64 30  5 14 87 19  7 55 51 53 90
Card 169: 71 12 82 98 36 48 21 26  6 69 | 53 33 15 17  2 25 20 69 27 99 86 44 72 54 88 65 18 62 16  9 96 68 95 39 13
Card 170: 79 98 45 46 68 49 34 17 91 13 |  6 78 25 41 15 72 87 59 73  9 94 37 34 93 92 27 81 30 60 70 11 50 10  1 36
Card 171:  6 12 87 66 97 65 74 75  9 88 |  5 26 49 14 34 81 64 46 55 72 39 30 98 82 76 31 23 95 96 68 54 56 86 15 69
Card 172: 54 13 27 98  1  9 53 71 17 11 | 92 62 55 54  1 17 24 40 39 98 11  5 80 75 71 99 53 20 50 81  9 89 27 13 86
Card 173: 84 40  4 48 94 41 27 81 57 72 | 31 22 78 87  1 48 52 68  3 99 72 65 84 94 27 33 70 81 12 77 36  4 40  2 10
Card 174: 86  4 71 29 27 36 42 56 77 19 | 56  3 93 27 76 86 77 10 60 89 53 71  4 52 74 19 96 36 29 88 94 39 24 42 49
Card 175: 58 17 42 69 68 99 20 25 45 97 | 17 25 55 53 58 20 11 69 12 73 40  4 59 45 26 76 50 99 36 68 97 42 62 60 31
Card 176: 16 88 74  2 77 24 89 56 80 58 | 83 28 44 77 16  5 17 27 23 47 38 14 20 39 88 60 80  2 79 58 24 78 64 34 69
Card 177: 51 37 28 89 68 53 46 10 69 38 | 94 70 49 57 86 34 38 66 68 87 89  4 60 64 39 28 77 52 54 99 16 13 19 33 51
Card 178: 76 31 77 22 92 72 74 15 61 29 |  9 50 77 58 90  1 89 83 67 71 76 22 31  5 12 27 20 29 30 96 92 95 42 80 93
Card 179: 29 75  5  6 71  1 53 82 41 74 | 93 45 76 41 10 58 74  6  1 82 71 77 94 27 14 31  5 59 46 29 53  8 61 62 18
Card 180: 41 23 21 18 11 87 68 35 80  7 | 34 95 14 80 67 24 11  7 21 75 13  9 18 71 50 68 53 91 78 27 88 16 81 23 25
Card 181: 58 43  4 38 99 45 94 25 69 97 | 33 10 77 17 39 61 12 24 68 35 11 87 52 19 25 44 72 81 36 48 22 38 98 34 55
Card 182: 31 79 39 50 78 66 16  4 91 41 | 25 80 85 81 12 98 11 13 65 30 87 60 24 94 70 36 99 92 14 10 53 51  2  8 76
Card 183: 60 37 31 23 29 77 57 34 76 94 | 94  7 57 41 70 52 53 14  8 96 80 51 69 19 81  6 47 54 67 17  3 56 22  2 76
Card 184: 19 78 23 11 26 79 37 42 83 66 | 54 99 50 68 65 89  7 86 92 18 41 96 71 44 67 48 59 37 93 64 91 75 16 11 29
Card 185: 45 85 65  6 17 27 82 35 74 13 | 79 56 63 87  5 32 75 15 69 84 16 42 12 88 60 33 92 77 35 28 66 48 21 95 97
Card 186: 10 45 16  1 46 27 50 59 83 65 | 82 14  4 49 57 59 95  7 68 78 98  2 52  9 44 39 23 24 27 97 58 93 50 26 54
Card 187: 69 86 61 71 65 42 40 27 25 59 | 11 67 62 26 39 87 51  9 38 41 19  6 48 75 18 99 27 24 33 73 95 81 83 64 50
Card 188: 79 28 69  4 93 38 31 62 18 67 | 12 68 83  3 76 41 23 61 11 73 94 74 30 32 90 20 58 46  7 98 65 82 88 49 48
Card 189: 48 76 43 18 98 50 36  6 90 20 | 22  9 44 45 69 51 47 55 42 52 57 46 77 65 85 37 73 31 14 83 41 92 32 27 23
Card 190:  6  8 77 28 62  2 30 76 94 90 |  5 20 94 96 43 55 41 75 76 38 45 78 33 77 90 68 62 63 23  6 30  8 12 28  2
Card 191: 74 95 81 19 30 18 84 67 41  4 | 67 19 27 93 46 30 81 20 41 57 17 74  4 11 35  5 43 37 95 18 58 28 83 84 42
Card 192: 88 95 72 25 27 10 19 15 63  5 | 72 49 73 95  5 19 85  7 88 25 40 51 61 52 76 15 29 27 35 91 96 63 98 70 10
Card 193: 60  5 92 22 73 76 64 83 30 89 | 42 34 19 83 89 72 32 11 64  2 60 63 73 92 67 17 30 87 41  5 69 22 29 76 85
Card 194: 58 66 59 28 55 35 61 20 22 89 | 63 37 49 68 89 59 19  4 28 92 24 26 87 62 97 66 60 61  6 99 58 53 57 47 45
Card 195: 85 35  2  7 77 71 21 32 25 70 | 35 63 77  7 64 46 61 71 22  2 66 32 85 12 90 70 84 43 40 21 30  1 50 25 17
Card 196: 31 61 66 19 79 35 85 68 15 54 | 74 85 35 20 75 40 44 14 69 54 33 31 61 51 43 68 56 16 37 46 15 77 79 66 19
Card 197: 64  3 29 40 63 46 95 66  8 96 |  3 40 95 85  7 67 29 74 64 96 37  9  2 46 98 86 66 63  6 71 78  8 36 39  4
Card 198: 27 26 20 24 50 96 81 76 68 19 | 66 59 40 67  9 55 69  8 75 65 18 82 73 41 70 21 23 52 83 11 89 58 60 97 22
Card 199: 28 94 90 41 60 57 93  8 51 48 | 14  5  3 31 15 79 87 55 39 75 29 44 27 46 22 61 18 36 59 68 52 48 34 81 95
Card 200: 22 27  9 45 65 86 67 41 46 66 | 98 43 46 41 55 56 15 73 71 89 84 86 77 51 17  3 34 65 18 67 76 22 26 74 38
Card 201: 43 60 39 89 35 24 11 52 21  4 | 10 60 89 39 18 40 85 29 30 21 35  8 31 52 96 99 59 49  7 88 25 78  4 47 58
Card 202: 47 76 20 50  3 10 53  6 15 78 |  2 86 20  4 78 10  9 53  1 72 58 65  3  6 76 51 71 80 47 77 90 39  5 15 61
Card 203: 55 10 36 49 22 76 50 52 86 79 | 31 21 70  7 47 38 17 84 97 75 86 90 55 50 64 77 18 24 69 82 71  5 34 23 65
Card 204: 32 79  4 51 24 36 52 16 95 47 | 69 72 25 70  6 20 37 82 29  3 61 75 13 34 54 49 76 67  7 15 40 64 97  9 74
Card 205: 46 89 30 18 15 24  1 73 34 50 | 65  6  3 69 21 52 94 29 25 54 37 49 44 26 15 79 32 31 67 56  9 47 41 57 10
Card 206: 51 80 60 54 95 50 76 14  2 92 | 20 84  9 60 14 74 10 94 90 47 58 64  7  4 15 89 79 36 80 70 68 81 69 93 19
Card 207: 27 94 17 47 12  3 73 26 52 32 | 38  4  2 52 59  8 75 10 39 17 89 34 93 85 27 96  7 11 84 24 62 26 80 49  6
Card 208: 65  9 31 99 98 59 96 46 63 12 | 68 48 61 38 94  1 23 71 66 35 21 30 20 58 14 12 93 19 52 45 92 25 49 80 65
Card 209: 11 98 57 87 82 50 16 45 46 25 | 54 11 82 73 13 24 55 65 51 66  6 70 60 44 18 36 12 16 84 27 74 22 71 29 49
Card 210: 77 36 67 31 25 58 28  8 16 29 | 98 85 14 50 99 58 37 31  2 39 84 24 65 80 41 62 97 78 20 74 40 30 83 38 47
Card 211: 18 77 49 70 59 85 16 74 57 35 | 71 43 27 78 18 61 15 77 20 37 65 96 67 97 29 55  7 23 25 94 76 33 88 75 30
Card 212: 40 48 44 77 98 29 21 99 82 79 | 81 52 56  6  2 11 94 62 22 65 43 47 83 69 42 17 70 92 36 77 87 15 71 27 66
Card 213:  8 24 48  5 27 13 71 26 17 21 | 63 11 89 35 69 98 91 60 51 70 12 62 39 43 38 19 55 20 57 32  6 79 95 76 73
"""

