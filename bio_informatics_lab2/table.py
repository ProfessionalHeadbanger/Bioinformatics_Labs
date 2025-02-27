import matplotlib.pyplot as plt 

# считываем файлы с последовательностями
with open('seq1.txt', 'r') as f1, open('seq2.txt', 'r') as f2: 
    seq1 = f1.read() 
    seq2 = f2.read()

# формируем матрицу с размерами последовательностей
matrix = [[1 if seq1[i] == seq2[j] else 0 for j in range(len(seq2))] for i in range(len(seq1))] 

# строим диаграмму
plt.imshow(matrix, cmap='binary', origin='lower') 
plt.xlabel('Stemphylium vesicarium isolate SVA1 calmodulin (calmodulin) gene, partial cds; mitochondrial') 
plt.ylabel('Alternaria sp. strain YZU 191419 calmodulin (calmodulin) gene, partial cds') 
plt.show()

# вычисляем процент идентичности последовательностей
matches = sum(1 for a, b in zip(seq1, seq2) if a == b) 
identity = (matches / min(len(seq1), len(seq2))) * 100 
print(f"Identity: {identity:.2f}%")