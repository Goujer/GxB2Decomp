using System.Collections.Generic;
using UnityEngine;

namespace DragonBones
{
	public class UnityEventDispatcher<T> : MonoBehaviour
	{
		private readonly Dictionary<string, ListenerDelegate<T>> _listeners;

		public void DispatchEvent(string type, T eventObject)
		{
		}

		public bool HasEventListener(string type)
		{
			return false;
		}

		public void AddEventListener(string type, ListenerDelegate<T> listener)
		{
		}

		public void RemoveEventListener(string type, ListenerDelegate<T> listener)
		{
		}
	}
}
