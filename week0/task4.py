import numpy

matrix = numpy.random.rand(5, 5)

print(f"Random matrix: \n{matrix}")

replaced_matrix = numpy.where(matrix > 0.5, 1, matrix)

print(f"New matrix: \n{replaced_matrix}")