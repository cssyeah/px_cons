const path = require('path');

module.exports = (env, argv) => {
  return {
    entry: "./src/main.jsx",
    output: {
      path: path.join(__dirname, "/dist"),
      filename: "main.js",
      clean: true,
    },
    module: {
      rules: [
        {
          test: /\.jsx$/,
          exclude: /node_modules/,
          use: [
            {
              loader: "babel-loader",
              options: {
                presets: [
                  [
                    "@babel/preset-react",
                    {
                      runtime: "automatic"
                    }
                  ]
                ],
              }
            }
          ]
        },
      ]
    },
    resolve: {
      extensions: ['.js', '.jsx'],
    },
    plugins: [
    ]
  }
}