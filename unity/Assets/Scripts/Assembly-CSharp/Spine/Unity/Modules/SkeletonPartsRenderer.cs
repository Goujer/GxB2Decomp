using System.Collections.Generic;
using UnityEngine;

namespace Spine.Unity.Modules
{
	public class SkeletonPartsRenderer : MonoBehaviour
	{
		private MeshGenerator meshGenerator;

		private MeshRenderer meshRenderer;

		private MeshFilter meshFilter;

		private MeshRendererBuffers buffers;

		private SkeletonRendererInstruction currentInstructions;

		public int matNum;

		public bool isSetNum;

		public Dictionary<string, Material> matList;

		public int lrQueue;

		public MeshGenerator MeshGenerator
		{
			get
			{
				return null;
			}
		}

		public MeshRenderer MeshRenderer
		{
			get
			{
				return null;
			}
		}

		public MeshFilter MeshFilter
		{
			get
			{
				return null;
			}
		}

		public int lastRenderQueue
		{
			get
			{
				return 0;
			}
			set
			{
			}
		}

		private void LazyIntialize()
		{
		}

		public void ClearMesh()
		{
		}

		public void RenderParts(ExposedList<SubmeshInstruction> instructions, int startSubmesh, int endSubmesh)
		{
		}

		public Material[] getUpdatedMaterials()
		{
			return null;
		}

		public void updateQueue()
		{
		}

		public void SetMaterialNum()
		{
		}

		public void SetPropertyBlock(MaterialPropertyBlock block)
		{
		}

		public static SkeletonPartsRenderer NewPartsRendererGameObject(Transform parent, string name)
		{
			return null;
		}
	}
}
