using UnityEngine;

public class LightmapBehaviour : MonoBehaviour
{
	private RendererRef[] RendererRefs;

	private MeshRenderer[] MeshRenderers;

	private static int CustomLightmapNum;

	private int SceneLightmapNum;

	private LightmapData[] LightmapDataArr;

	private bool originFog;

	private FogMode originFogMode;

	private Color originFogColor;

	private float originFogStartDistance;

	private float originFogEndDistance;

	private float originFogDensity;

	private Color originAmbientLight;

	private static readonly Color[] StateSkin;

	private void OnDestroy()
	{
	}

	private void InitRendererRef(RendererRef[] rendererRefs)
	{
	}

	public int GetSceneLightmapNum()
	{
		return 0;
	}

	public void SetupLightmap(SceneData sceneData)
	{
	}

	public void ChangeLightmap()
	{
	}

	public void ResetLightmap()
	{
	}

	private void InitialCustomLightmap()
	{
	}
}
