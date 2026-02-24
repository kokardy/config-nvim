from typing import Callable
from functools import wraps
from datetime import datetime
import time
import textwrap


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

    t = """
    This is a test string.
        indent block.
    It has multiple lines.
    Each line is indented.
    We will dedent it.
    """

    print(textwrap.dedent(t).strip())

    trigger_more_errors()


def trigger_more_errors() -> None:
    # 1. Incompatible return type
    def get_int() -> int:
        return "string"

    # 2. Argument count mismatch
    def take_two(a: int, b: int) -> None:
        pass

    take_two(1)

    # 3. List item type mismatch
    numbers: list[int] = [1, 2, "3"]

    # 4. Dict key/value type mismatch
    data: dict[str, int] = {"key": "value"}

    # 5. Accessing non-existent attribute
    x: int = 10
    x.append(5)

    # 6. Unused variable (Linter warning)
    unused_var = 100


if __name__ == "__main__":
    main()

