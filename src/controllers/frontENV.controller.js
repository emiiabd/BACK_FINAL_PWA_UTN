import { response200, response500 } from "../utils/responses.util.js"

/* 
  G_MAPS_API_KEY: 'AIzaSyDho985O13eR1wkuDX00c2vWwkA8xabyCc',
  G_CAPTCHA_API_KEY: '6LeezH0qAAAAAImjUoIqHzED8LdLmJHIwQAd1wzM' 
*/

const getGoogleMapsFrontApiKey = async (req, res) => {
  try {
    const G_MAPS_API_KEY = process.env.G_MAPS_FRONT_KEY

    const response = response200('OK', { api_key: G_MAPS_API_KEY })
    return res.status(200).json(response)
  }
  catch (error) {
    const response = response500('INTERNAL SERVER ERROR', { detail: error.message })
    return res.status(500).json(response)
  }
}

export { getGoogleMapsFrontApiKey }