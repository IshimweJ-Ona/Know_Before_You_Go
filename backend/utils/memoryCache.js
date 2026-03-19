export const createMemoryCache = (defaultTtlSeconds = 300) => {
    const store = new Map();

    const get = (key) => {
        const hit = store.get(key);
        if (!hit) return null;
        if (Date.now() > hit.expiresAt) {
            store.delete(key);
            return null;
        }
        return hit.value;
    };

    const set = (key, value, ttlSeconds = defaultTtlSeconds) => {
        store.set(key, { value, expiresAt: Date.now() + ttlSeconds * 1000 });
    };

    const clear = () => store.clear();

    return { get, set, clear };
};

