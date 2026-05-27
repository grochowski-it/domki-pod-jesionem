import { useSupabaseClient } from '#imports'

export const useSupabaseSafe = () => {
  const client = useSupabaseClient()

  let reqCount = 0
  let lastReqTime = Date.now()

  const limitRate = async () => {
    const now = Date.now()
    if (now - lastReqTime > 1000) {
      reqCount = 0
      lastReqTime = now
    }

    if (reqCount >= 5) {
      const waitTime = 1000 - (now - lastReqTime)
      if (waitTime > 0) {
        await new Promise(resolve => setTimeout(resolve, waitTime))
      }
      reqCount = 0
      lastReqTime = Date.now()
    }

    reqCount++
  }

  const safeQuery = async (queryFn: () => Promise<any>) => {
    let retries = 0
    const maxRetries = 3
    let delay = 1000

    while (retries < maxRetries) {
      try {
        await limitRate()

        const timeoutPromise = new Promise((_, reject) =>
          setTimeout(() => reject(new Error('Timeout: Request exceeded 30s')), 30000)
        )

        const result = await Promise.race([queryFn(), timeoutPromise])
        return result
      } catch (error: any) {
        retries++
        if (retries >= maxRetries) {
          throw new Error('STOP: Przekroczono 3 nieudane próby.')
        }
        await new Promise(resolve => setTimeout(resolve, delay))
        delay *= 2
      }
    }
  }

  return {
    client,
    safeQuery
  }
}
