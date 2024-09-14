const path = require("path");
const MiniCssExtractPlugin = require("mini-css-extract-plugin");

module.exports = {
  entry: {
    main: "./src/js/index.js",
    style: "./src/scss/index.scss",
  },
  output: {
    filename: "assets/template/js/[name].js",
    path: path.resolve(__dirname, "./"),
  },
  module: {
    rules: [
      {
        test: /\.(woff|woff2|eot|ttf|otf)$/i,
        type: "asset/resource",
        generator: {
          filename: "assets/template/fonts/[name][ext][query]",
        },
      },
      {
        test: /\.js$/,
        exclude: /node_modules/,
        use: {
          loader: "babel-loader",
        },
      },
      {
        test: /\.scss$/,
        use: [MiniCssExtractPlugin.loader, "css-loader", "sass-loader"],
      },
    ],
  },
  plugins: [
    new MiniCssExtractPlugin({
      filename: "assets/template/css/[name].css",
    }),
  ],

  devServer: {
    proxy: [
      {
        context: () => true,
        target: "http://gbi-azbuka",
        changeOrigin: true,
        secure: false,
      },
    ],
    watchFiles: ["src/**/*", "core/elements/**/*"],
    open: true,
    host: "gbi-azbuka",
    port: 8080,
    hot: true,
    liveReload: true,
  },

  mode: "development",
  watchOptions: {
    ignored: /node_modules/,
  },
};
