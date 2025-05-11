using System;
using System.Collections;
using System.Collections.Generic;

namespace LuaInterface
{
	public class LuaDictTable : IDisposable, IEnumerable<DictionaryEntry>, IEnumerable
	{
		private class Enumerator : IEnumerator<DictionaryEntry>, IEnumerator, IDisposable
		{
			private LuaState state;

			private DictionaryEntry current;

			private int top;

			object IEnumerator.Current
			{
				get
				{
					return null;
				}
			}

			public DictionaryEntry Current
			{
				get
				{
					return default(DictionaryEntry);
				}
			}

			public Enumerator(LuaDictTable list)
			{
			}

			public bool MoveNext()
			{
				return false;
			}

			public void Reset()
			{
			}

			public void Dispose()
			{
			}
		}

		private LuaTable table;

		private LuaState state;

		public object Item
		{
			get
			{
				return null;
			}
			set
			{
			}
		}

		public LuaDictTable(LuaTable table)
		{
		}

		public void Dispose()
		{
		}

		public Hashtable ToHashtable()
		{
			return null;
		}

		public IEnumerator<DictionaryEntry> GetEnumerator()
		{
			return null;
		}

		IEnumerator IEnumerable.GetEnumerator()
		{
			return null;
		}
	}
	public class LuaDictTable<K, V> : IDisposable, IEnumerable<LuaDictEntry<K, V>>, IEnumerable
	{
		private class Enumerator : IEnumerator<LuaDictEntry<K, V>>, IEnumerator, IDisposable
		{
			private LuaState state;

			private LuaDictEntry<K, V> current;

			private int top;

			object IEnumerator.Current
			{
				get
				{
					return null;
				}
			}

			public LuaDictEntry<K, V> Current
			{
				get
				{
					return default(LuaDictEntry<K, V>);
				}
			}

			public Enumerator(LuaDictTable<K, V> list)
			{
			}

			public bool MoveNext()
			{
				return false;
			}

			public void Reset()
			{
			}

			public void Dispose()
			{
			}
		}

		private LuaTable table;

		private LuaState state;

		public V Item
		{
			get
			{
				return default(V);
			}
			set
			{
			}
		}

		public LuaDictTable(LuaTable table)
		{
		}

		public void Dispose()
		{
		}

		public Dictionary<K, V> ToDictionary()
		{
			return null;
		}

		public IEnumerator<LuaDictEntry<K, V>> GetEnumerator()
		{
			return null;
		}

		IEnumerator IEnumerable.GetEnumerator()
		{
			return null;
		}
	}
}
