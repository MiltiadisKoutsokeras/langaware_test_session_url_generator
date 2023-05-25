import type { NextPage } from 'next'
import Head from 'next/head'
import Image from 'next/image'
import { useState } from "react"
import Link from 'next/link';

import styles from '../styles/Home.module.css'
import packageInfo from "../package.json"

const Home: NextPage = () => {
  const [loading, setLoading] = useState(false)
  const [error, setError] = useState('')
  const [ephemeralURL, setEphemeralURL] = useState('')

  return (
    <div className={styles.container}>
      <Head>
        <title>langaware_test_session_url_generator</title>
        <meta name="description" content="langaware_test_session_url_generator" />
        <link rel="icon" href="/favicon.ico" />
      </Head>

      <header className={styles.header}>
        <Image src="/langaware-logo.webp" alt="LANGaware Logo"
          width={230} height={101} />

        <div className={styles.title_container}>
          <h2>
            Web Application for generating Test session ephemeral URLs.
          </h2>
        </div>
      </header>

      <main className={styles.main}>
        <div>
          <button onClick={
            async function generate_url() {
              setLoading(true)

              fetch("/api/generate_url").then((resp) => {
                resp.json().then((resp) => {
                  setLoading(false)
                  setEphemeralURL(resp.url)
                  setError('')
                }).catch((resp) => {
                  setError('Cannot read returned ephemeral URL!')
                  setLoading(false)
                })
              }).catch((resp) => {
                setError('Cannot get ephemeral URL!')
                setLoading(false)
              })
            }
          }>Generate Ephemeral URL</button>

          {loading && <div>Please wait...</div>}
          {error != '' && <div>{error}</div>}
          {ephemeralURL != '' && ClickHereLink(ephemeralURL)}
        </div>
      </main>

      <footer className={styles.footer}>
        <div>All Rights Reserved</div>

        <a href="https://www.langaware.com" target="_blank"
          rel="noopener noreferrer">Powered by LANGaware</a>

        <div>Version: {packageInfo.version}</div>
      </footer>
    </div>
  )
}

function ClickHereLink(url: string) {
  return (
    <div>
      Click <Link href={url} target='_blank'>here</Link> to perform a LANGaware test session
    </div>
  )
}

export default Home
