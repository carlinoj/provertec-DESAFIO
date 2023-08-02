import axios,{AxiosPromise} from "axios";
import { useQuery } from "react-query";
import { ProjectData } from "../interface/ProjectData";

const apiUrl = 'http://localhost:8080';

const fetchData = async (): AxiosPromise<ProjectData[]> => {
    const response = axios.get(apiUrl + "/projects");
    return response;
}

export function useProjectData(){
    const query = useQuery({
        queryFn: fetchData,
        queryKey: ['project-data'],
        retry: 2
    })

    return {
        ...query,
        data: query.data?.data
    }
}