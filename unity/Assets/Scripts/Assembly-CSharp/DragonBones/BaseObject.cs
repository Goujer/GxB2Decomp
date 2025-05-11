using System;
using System.Collections.Generic;

namespace DragonBones
{
	public abstract class BaseObject
	{
		private static uint _hashCode;

		private static uint _defaultMaxCount;

		private static readonly Dictionary<Type, uint> _maxCountMap;

		private static readonly Dictionary<Type, List<BaseObject>> _poolsMap;

		public readonly uint hashCode;

		private static void _ReturnObject(BaseObject obj)
		{
		}

		public static void SetMaxCount(Type classType, uint maxCount)
		{
		}

		public static void ClearPool(Type classType)
		{
		}

		public static T BorrowObject<T>() where T : BaseObject, new()
		{
			return null;
		}

		protected abstract void _OnClear();

		public void ReturnToPool()
		{
		}
	}
}
