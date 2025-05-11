using System.Collections.Generic;

namespace LuaInterface
{
	public class LuaObjectPool
	{
		private class PoolNode
		{
			public int index;

			public object obj;

			public PoolNode(int index, object obj)
			{
			}
		}

		private List<PoolNode> list;

		private PoolNode head;

		private int count;

		public object Item
		{
			get
			{
				return null;
			}
		}

		public void Clear()
		{
		}

		public int Add(object obj)
		{
			return 0;
		}

		public object TryGetValue(int index)
		{
			return null;
		}

		public object Remove(int pos)
		{
			return null;
		}

		public object Destroy(int pos)
		{
			return null;
		}

		public object Replace(int pos, object o)
		{
			return null;
		}
	}
}
