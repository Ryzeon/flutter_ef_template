## as for a path as a variable with promt ./int_core.sh /folder
if ["$#" -ne 2]; then
    echo "Usage: ./int_core.sh folder bc"
    exit 1
fi

base_path=$1
bc=$2

# Creation of folder
mkdir  -p $base_path/feature/$bc

# Create of data folders
mkdir -p $base_path/feature/$bc/data
mkdir -p $base_path/feature/$bc/data/remote
mkdir -p $base_path/feature/$bc/data/local
mkdir -p $base_path/feature/$bc/data/repository

# Create of domain folders
mkdir -p $base_path/feature/$bc/domain

# Create of presentation folders
mkdir -p $base_path/feature/$bc/presentation
mkdir -p $base_path/feature/$bc/presentation/blocs
mkdir -p $base_path/feature/$bc/presentation/widgets
mkdir -p $base_path/feature/$bc/presentation/pages
