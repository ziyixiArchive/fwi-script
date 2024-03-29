from glob import glob
from os.path import join, basename
import pickle

basedir = "/mnt/ls15/scratch/users/xiziyi/process_asdf/windows_20s"
output = "/mnt/ls15/scratch/users/xiziyi/process_asdf/logs/windows_num_20.txt"


def load_pickle(fname):
    with open(fname, "rb") as f:
        data = pickle.load(f)
    return data


def main():
    allfiles = glob(join(basedir, "*pkl"))
    with open(output, "w") as g:
        for fpath in allfiles:
            fname = basename(fpath)[:-4]
            data = load_pickle(fpath)
            num_windows = 0
            len_windows = 0
            for key in data:
                for channel in data[key]:
                    num_windows += len(channel)
            num_windows = num_windows/len(data.keys())
            g.write(f"{fname} {num_windows} \n")


if __name__ == "__main__":
    main()
