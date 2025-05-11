using System;
using System.Collections.Generic;
using UnityEngine;

namespace LuaInterface
{
	public class ObjectTranslator
	{
		private class DelayGC
		{
			public int id;

			public UnityEngine.Object obj;

			public float time;

			public DelayGC(int id, UnityEngine.Object obj, float time)
			{
			}
		}

		private class CompareObject : IEqualityComparer<object>
		{
			public new bool Equals(object x, object y)
			{
				return false;
			}

			public int GetHashCode(object obj)
			{
				return 0;
			}
		}

		public readonly Dictionary<object, int> objectsBackMap;

		public readonly LuaObjectPool objects;

		private List<DelayGC> gcList;

		private static ObjectTranslator _translator;

		public bool LogGC { get; set; }

		public int AddObject(object obj)
		{
			return 0;
		}

		public static ObjectTranslator Get(IntPtr L)
		{
			return null;
		}

		private void RemoveObject(object o, int udata)
		{
		}

		public void RemoveObject(int udata)
		{
		}

		public object GetObject(int udata)
		{
			return null;
		}

		public void Destroy(int udata)
		{
		}

		public void DelayDestroy(int id, float time)
		{
		}

		public bool Getudata(object o, out int index)
		{
			index = default(int);
			return false;
		}

		public void Destroyudata(int udata)
		{
		}

		public void SetBack(int index, object o)
		{
		}

		private bool RemoveFromGCList(int id)
		{
			return false;
		}

		private void DestroyUnityObject(int udata, UnityEngine.Object obj)
		{
		}

		public void Collect()
		{
		}

		public void Dispose()
		{
		}
	}
}
