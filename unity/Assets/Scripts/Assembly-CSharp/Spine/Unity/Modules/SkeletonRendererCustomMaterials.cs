using System;
using System.Collections.Generic;
using UnityEngine;

namespace Spine.Unity.Modules
{
	[ExecuteInEditMode]
	public class SkeletonRendererCustomMaterials : MonoBehaviour
	{
		[Serializable]
		public struct SlotMaterialOverride : IEquatable<SlotMaterialOverride>
		{
			public bool overrideDisabled;

			public string slotName;

			public Material material;

			public bool Equals(SlotMaterialOverride other)
			{
				return false;
			}
		}

		[Serializable]
		public struct AtlasMaterialOverride : IEquatable<AtlasMaterialOverride>
		{
			public bool overrideDisabled;

			public Material originalMaterial;

			public Material replacementMaterial;

			public bool Equals(AtlasMaterialOverride other)
			{
				return false;
			}
		}

		public SkeletonRenderer skeletonRenderer;

		[SerializeField]
		protected List<SlotMaterialOverride> customSlotMaterials;

		[SerializeField]
		protected List<AtlasMaterialOverride> customMaterialOverrides;

		private void SetCustomSlotMaterials()
		{
		}

		private void RemoveCustomSlotMaterials()
		{
		}

		private void SetCustomMaterialOverrides()
		{
		}

		private void RemoveCustomMaterialOverrides()
		{
		}

		private void OnEnable()
		{
		}

		private void OnDisable()
		{
		}
	}
}
