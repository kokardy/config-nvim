from typing import Callable
from functools import wraps
from datetime import datetime
import time


def timer[**P, R](func: Callable[P, R]) -> Callable[P, R]:
    """Timer is a decorator that times a function execution."""

    @wraps(func)
    def wrapper(*args: P.args, **kwargs: P.kwargs) -> R:
        start = datetime.now()
        result = func(*args, **kwargs)
        end = datetime.now()
        print(f"Function {func.__name__} took {end - start} to execute.")
        return result

    return wrapper


@timer
def test_timer() -> None:
    """Test for timer decorator."""
    time.sleep(1)


def main() -> None:
    print("OK")
    print("schedule schedale")
    a: str = ""
    a = 3
    print(a)

    my_streaming_response_2: str = "response"

    my_streaming_response_2 = "new response"

    print(my_streaming_response_2)

    test_timer()


if __name__ == "__main__":
    main()
