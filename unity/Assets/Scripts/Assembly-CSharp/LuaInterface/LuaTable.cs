namespace LuaInterface
{
	public class LuaTable : LuaBaseRef
	{
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

		public int Length
		{
			get
			{
				return 0;
			}
		}

		public LuaTable(int reference, LuaState state)
		{
		}

		public T RawGetIndex<T>(int index)
		{
			return default(T);
		}

		public void RawSetIndex<T>(int index, T value)
		{
		}

		public V RawGet<K, V>(K key)
		{
			return default(V);
		}

		public void RawSet<K, V>(K key, V arg)
		{
		}

		public T GetTable<T>(string key)
		{
			return default(T);
		}

		public void SetTable<T>(string key, T arg)
		{
		}

		public LuaFunction RawGetLuaFunction(string key)
		{
			return null;
		}

		public LuaFunction GetLuaFunction(string key)
		{
			return null;
		}

		private bool BeginCall(string name, int top)
		{
			return false;
		}

		public void Call(string name)
		{
		}

		public void Call<T1>(string name, T1 arg1)
		{
		}

		public void Call<T1, T2>(string name, T1 arg1, T2 arg2)
		{
		}

		public void Call<T1, T2, T3>(string name, T1 arg1, T2 arg2, T3 arg3)
		{
		}

		public void Call<T1, T2, T3, T4>(string name, T1 arg1, T2 arg2, T3 arg3, T4 arg4)
		{
		}

		public void Call<T1, T2, T3, T4, T5>(string name, T1 arg1, T2 arg2, T3 arg3, T4 arg4, T5 arg5)
		{
		}

		public void Call<T1, T2, T3, T4, T5, T6>(string name, T1 arg1, T2 arg2, T3 arg3, T4 arg4, T5 arg5, T6 arg6)
		{
		}

		public R1 Invoke<R1>(string name)
		{
			return default(R1);
		}

		public R1 Invoke<T1, R1>(string name, T1 arg1)
		{
			return default(R1);
		}

		public R1 Invoke<T1, T2, R1>(string name, T1 arg1, T2 arg2)
		{
			return default(R1);
		}

		public R1 Invoke<T1, T2, T3, R1>(string name, T1 arg1, T2 arg2, T3 arg3)
		{
			return default(R1);
		}

		public R1 Invoke<T1, T2, T3, T4, R1>(string name, T1 arg1, T2 arg2, T3 arg3, T4 arg4)
		{
			return default(R1);
		}

		public R1 Invoke<T1, T2, T3, T4, T5, R1>(string name, T1 arg1, T2 arg2, T3 arg3, T4 arg4, T5 arg5)
		{
			return default(R1);
		}

		public R1 Invoke<T1, T2, T3, T4, T5, T6, R1>(string name, T1 arg1, T2 arg2, T3 arg3, T4 arg4, T5 arg5, T6 arg6)
		{
			return default(R1);
		}

		public string GetStringField(string name)
		{
			return null;
		}

		public void AddTable(string name)
		{
		}

		public object[] ToArray()
		{
			return null;
		}

		public override string ToString()
		{
			return null;
		}

		public LuaArrayTable ToArrayTable()
		{
			return null;
		}

		public LuaDictTable ToDictTable()
		{
			return null;
		}

		public LuaDictTable<K, V> ToDictTable<K, V>()
		{
			return null;
		}

		public LuaTable GetMetaTable()
		{
			return null;
		}
	}
}
