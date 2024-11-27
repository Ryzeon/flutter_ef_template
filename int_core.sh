## as for a path as a variable with promt ./int_core.sh /folder
if ["$#" -ne 1]; then
    echo "Usage: ./int_core.sh /folder"
    exit 1
fi

base_path=$1

mkdir  -p $base_path/core

cat > $base_path/core/app_constants.dart <<EOL
class AppConstants {
  static const String baseUrl = 'API_URL';

  static const String randomEndpoint = '/random';

  static const String apiKey = "API_KEY";
  static const String pageQuery = '&page=';

  static const int pageSize = 20;
  static const int firstPageKey = 1;
}
EOL

cat > $base_path/core/resource.dart <<EOL
sealed class Resource<T> {
  final T? data;
  final String? message;
  const Resource({this.data, this.message});
}

class Success<T> extends Resource<T> {
  Success(T data) : super(data: data);
}

class Error<T> extends Resource<T> {
  Error(String message, {super.data}) : super(message: message);
}
EOL

