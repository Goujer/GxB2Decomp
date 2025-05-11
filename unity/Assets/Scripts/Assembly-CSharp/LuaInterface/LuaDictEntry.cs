namespace LuaInterface
{
	public struct LuaDictEntry<K, V>
	{
		public K Key { get; set; }

		public V Value { get; set; }

		public LuaDictEntry(K key, V value)
		{
			Key = default(K);
			Value = default(V);
		}
	}
}
