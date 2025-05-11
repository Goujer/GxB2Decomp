using System.Collections.Generic;
using UnityEngine;

namespace Spine.Unity.Modules
{
	[DisallowMultipleComponent]
	public class SlotBlendModes : MonoBehaviour
	{
		public struct MaterialTexturePair
		{
			public Texture2D texture2D;

			public Material material;
		}

		private static Dictionary<MaterialTexturePair, Material> materialTable;

		public Material multiplyMaterialSource;

		public Material screenMaterialSource;

		private Texture2D texture;

		internal static Dictionary<MaterialTexturePair, Material> MaterialTable
		{
			get
			{
				return null;
			}
		}

		public bool Applied { get; private set; }

		internal static Material GetMaterialFor(Material materialSource, Texture2D texture)
		{
			return null;
		}

		private void Start()
		{
		}

		private void OnDestroy()
		{
		}

		public void Apply()
		{
		}

		public void Remove()
		{
		}

		public void GetTexture()
		{
		}
	}
}
