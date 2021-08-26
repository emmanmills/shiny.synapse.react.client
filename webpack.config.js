var path = require('path');

module.exports = {
    entry: [path.join(__dirname, 'srcjs', 'user_card.jsx')],
    output: {
        path: path.join(__dirname, 'inst/htmlwidgets'),
        filename: 'user_card.js'
    },
    module: {
        rules: [
            {
                test: /\.(js|jsx)?$/,
                exclude: /node_modules/,
                loader: 'babel-loader',
                options: {
                    presets: ['@babel/preset-env', '@babel/preset-react'],
                    plugins: [['@babel/plugin-transform-runtime', {
                        "corejs": 2
                    }]]
                }
            },
            // For CSS so that import "path/style.css"; works
            {
                test: /\.css$/,
                use: ['style-loader', 'css-loader']
            },

            /**
             * File loader for supporting images, for example, in CSS files.
             */
            {
                test: /\.(jpg|png|gif)$/,
                use: 'file-loader'
            },

            /**
             * File loader for supporting images, for example, in CSS files.
             */
            {
                test: /\.(eot|woff|woff2|svg|ttf)([\?]?.*)$/,
                use: 'file-loader'
            }
        ]
    },
    externals: {
        'react': 'window.React',
        'react-dom': 'window.ReactDOM',
        'reactR': 'window.reactR'
    },
    stats: {
        colors: true
    },
    devtool: 'source-map'
};
