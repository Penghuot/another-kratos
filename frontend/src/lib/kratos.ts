import { Configuration, FrontendApi } from '@ory/client'

export const kratosConfig = new Configuration({
  basePath: 'https://another-kratos-production.up.railway.app',
  baseOptions: {
    withCredentials: true,
  },
})

export const kratos = new FrontendApi(kratosConfig)

export const getKratosUrl = () => {
  return 'https://another-kratos-production.up.railway.app'
}

export const getAppUrl = () => {
  return process.env.NEXT_PUBLIC_APP_URL || 'http://localhost:3000'
}
