import type { NextPage } from 'next'
import Head from 'next/head'
import Image from 'next/image'
import styles from '../styles/Home.module.css'

const Home: NextPage = () => {
  return (
    <div className={styles.container}>
      <Head>
        <title>langaware_test_session_url_generator</title>
        <meta name="description" content="langaware_test_session_url_generator" />
        <link rel="icon" href="/favicon.ico" />
      </Head>

      <main className={styles.main}>
        <Image src="/langaware-logo.webp" alt="LANGaware Logo"
          width={230} height={101} />

        <h1 className={styles.title}>
          langaware_test_session_url_generator
        </h1>

        <h2>MiltiadisKoutsokeras</h2>

        <h2>
          TODO Project Description
        </h2>
      </main>

      <footer className={styles.footer}>
        All Rights Reserved

        <a href="https://www.langaware.com" target="_blank"
          rel="noopener noreferrer">Powered by LANGaware</a>

        {/* TODO: Add links to Privacy Policy and Terms of Use */}
        <a href="https://www.langaware.com/TODO" target="_blank"
          rel="noopener noreferrer">Privacy Policy</a>

        <a href="https://www.langaware.com/TODO" target="_blank"
          rel="noopener noreferrer">Terms of Use</a>

        {/* TODO: Print Application version */}
        Version: TODO
      </footer>
    </div>
  )
}

export default Home
