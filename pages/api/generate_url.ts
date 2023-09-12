// Next.js API route support: https://nextjs.org/docs/api-routes/introduction
import type { NextApiRequest, NextApiResponse } from 'next'

type Data = {
  url: string
}

export default async function handler(
  req: NextApiRequest,
  res: NextApiResponse<Data>
) {
  const headers = new Headers()
  headers.append("accept", "application/json")
  headers.append("langaware_api_key", `${process.env.API_KEY}`)
  const requestOptions = {
    method: "GET",
    headers
  }
  const url = `${process.env.BACKEND_URL}/webapp_temp_url`
  const resp = await fetch(url, requestOptions)

  if (resp.status === 200) {
    const data = await resp.json()
    res.status(200).json({ url: data })
  } else {
    res.status(resp.status)
  }
}
