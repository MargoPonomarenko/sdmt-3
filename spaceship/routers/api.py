import numpy
from fastapi import APIRouter

router = APIRouter()


@router.get('')
def hello_world() -> dict:
    return {'msg': 'Hello, World!'}

@router.get('/matrixes')
def generate_matrix() -> dict:
    matrix_A = numpy.random.rand(10, 10)
    matrix_B = numpy.random.rand(10, 10)
    product = numpy.dot(matrix_A, matrix_B)
    result = {
        "matrix_a": matrix_A.tolist(),
        "matrix_b": matrix_B.tolist(),
        "product": product.tolist()
    }

    return result