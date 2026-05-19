"""Trivial passing test. Gives CI something to run before any real code exists.
Delete once real tests appear in Phase 4."""

from ukfca import __version__


def test_version_string() -> None:
    """Package exposes a version string."""
    assert isinstance(__version__, str)
    assert __version__ == "0.1.0"
