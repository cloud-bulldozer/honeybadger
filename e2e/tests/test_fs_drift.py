from pytest import mark
from models.test_base import TestBase, default_timeout


@mark.fs_drift
class TestFSDrift(TestBase):
    workload = "fs_drift"
    indices = [
        "ripsaw-fs-drift-results",
        "ripsaw-fs-drift-rsptimes",
        "ripsaw-fs-drift-rates-over-time"
    ]

    @mark.timeout(default_timeout)
    def test_fs_drift(self, run):
        self.run_and_check_benchmark(run)