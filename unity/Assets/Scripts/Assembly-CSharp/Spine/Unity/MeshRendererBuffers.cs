using System;
using UnityEngine;

namespace Spine.Unity
{
	public class MeshRendererBuffers : IDisposable
	{
		public class SmartMesh : IDisposable
		{
			public Mesh mesh;

			public SkeletonRendererInstruction instructionUsed;

			public void Clear()
			{
			}

			public void Dispose()
			{
			}
		}

		private DoubleBuffered<SmartMesh> doubleBufferedMesh;

		internal readonly ExposedList<Material> submeshMaterials;

		internal Material[] sharedMaterials;

		public void Initialize()
		{
		}

		public Material[] GetUpdatedSharedMaterialsArray()
		{
			return null;
		}

		public bool MaterialsChangedInLastUpdate()
		{
			return false;
		}

		public void UpdateSharedMaterials(ExposedList<SubmeshInstruction> instructions)
		{
		}

		public SmartMesh GetNextMesh()
		{
			return null;
		}

		public void Clear()
		{
		}

		public void Dispose()
		{
		}
	}
}
