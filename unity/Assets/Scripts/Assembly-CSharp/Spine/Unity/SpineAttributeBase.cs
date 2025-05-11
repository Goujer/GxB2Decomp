using UnityEngine;

namespace Spine.Unity
{
	public abstract class SpineAttributeBase : PropertyAttribute
	{
		public string dataField;

		public string startsWith;

		public bool includeNone;

		public bool fallbackToTextField;
	}
}
